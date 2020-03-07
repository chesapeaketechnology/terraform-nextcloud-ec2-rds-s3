data "template_cloudinit_config" "cloudinit-nextcloud" {
  gzip          = false
  base64_encode = false

  # Download nextcloud and install dependencies
  part {
    content_type = "text/x-shellscript"
    content = templatefile("${path.module}/scripts/1_download_nextcloud_and_deps.sh", {})
  }

  # Mount EBS Volume as datadir
  /*
  part {
    content_type = "text/x-shellscript"
    content = templatefile("${path.module}/scripts/23_mount_ebs.sh", {
                    data_dir = var.data_dir,
    })
  }
  */

  # Configure Nextcloud database in RDS
  part {
    content_type = "text/x-shellscript"
    content = templatefile("${path.module}/scripts/2_configure_db_rds.sh", {
                    db_name = var.db_name, 
                    db_user = var.db_user, 
                    db_pass = var.db_pass, 
                    db_endpoint = var.db_endpoint 

                    admin_user = var.admin_user,
                    admin_pass = var.admin_pass,
                    data_dir = var.data_dir,
    })
  }

  # Configure Nextcloud datastore in S3
  part {
    content_type = "text/x-shellscript"
    content = templatefile("${path.module}/scripts/3_configure_datastore_s3.sh", {
                    aws_region = var.aws_region,
                    s3_bucket_name = var.s3_bucket_name,
                    user_access_key = var.s3_access_key,
                    user_secret_key = var.s3_secret_key
    })
  }

  # Install Apache conf for Nextcloud
  part {
    content_type = "text/x-shellscript"
    content = templatefile("${path.module}/scripts/4_nextcloud_apache_conf.sh", {})
  }

  # Finish Apache configuration and start service
  part {
    content_type = "text/x-shellscript"
    content = templatefile("${path.module}/scripts/5_finish_config_and_start.sh", {})
  }
}