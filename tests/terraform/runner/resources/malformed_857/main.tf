resource "aws_instance" {
  ami           = "amiid"
  instance_type = "t3.micro"
  tags = {
    yor_trace = "f7288aca-55b6-4157-a109-51079a4bdefc"
  }
}
