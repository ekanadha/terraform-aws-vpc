
resource "aws_launch_configuration" "web_launch_config" {
  name          = "web_launch_config"
  image_id      = "ami-090fa75af13c156b4"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.web-sg.id}"]
  user_data     = file("./nginx.sh")
}

resource "aws_launch_configuration" "apps_launch_config" {
  name          = "apps_launch_config"
  image_id      = "ami-090fa75af13c156b4"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.apps-sg.id}"]
  user_data     = file("./nginx.sh")
}