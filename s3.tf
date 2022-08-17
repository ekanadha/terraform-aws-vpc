# resource "aws_s3_bucket" "rugged_buckets" {
#   count          = 3
#   bucket         = "${var.s3_bucket_names}-${count.index}"
#   #aws_s3_bucket_acl           = "private"

# }