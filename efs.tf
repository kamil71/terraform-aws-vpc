resource "aws_efs_file_system" "magento-efs" {
   creation_token = "efs-demo"
   performance_mode = "generalPurpose"
   throughput_mode = "bursting"
   encrypted = "true"
 tags = {
     Name = "Magento-EFS"
   }
 }

resource "aws_efs_mount_target" "efs-mount" {
   file_system_id  = "${aws_efs_file_system.magento-efs.id}"
   subnet_id = "${aws_subnet.public_subnet.0.id}"
   security_groups = ["${aws_security_group.efs-sg.id}"]
}


resource "aws_security_group" "efs-sg" {
   name = "efs-sg"
   description= "Allos inbound efs traffic from ec2"
   vpc_id = aws_vpc.vpc.id

   ingress {
     security_groups = ["${aws_security_group.wrodpress-sg.id}"]
     from_port = 2049
     to_port = 2049 
     protocol = "tcp"
   }     
        
   egress {
     security_groups = ["${aws_security_group.wrodpress-sg.id}"]
     from_port = 0
     to_port = 0
     protocol = "-1"
   }
 }