resource "aws_instance" "nextcloud_app_instance"{
    ami = "ami-12531d73"
    ebs_optimized = true
    instance_type = var.instance_type
    private_ip = "10.101.1.31"
    vpc_security_group_ids = ["sg-0bee186e"]
    subnet_id = var.subnet_id
    volume_tags = {
        Name = "NEXTCLOUD"
    }
    root_block_device {
    encrypted = true
    volume_size = 80
    }

    key_name = var.key_name

    tags = {
        Name = "NEXTCLOUD"
    }

    user_data = "${data.template_cloudinit_config.cloudinit-nextcloud.rendered}"
}

/*
resource "aws_ebs_volume" "ebs-nextcloud" {
    availability_zone = "us-gov-west-1b"
    size = 100
    type = "sc1"
    encrypted = true
    tags = {
        Name = "NEXTCLOUD_CACHE"
    }
}

resource "aws_volume_attachment" "ebs-nextcloud-attachment" {
  device_name = "/dev/sdg"
  volume_id = "${aws_ebs_volume.ebs-nextcloud.id}"
  instance_id = "${aws_instance.nextcloud_app_instance.id}"
}
*/