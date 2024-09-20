module "s3_static_website" {
  source = "../../modules/s3-static-website"
  bucket_prefix   = var.bucket_prefix
  index_document  = var.index_document
  error_document  = var.error_document
  html_source_dir = var.html_source_dir
}


resource "null_resource" "invalidate_html" {
  triggers = {
    index_file_hash = filemd5("${var.html_source_dir}/${var.index_document}")
    error_file_hash = filemd5("${var.html_source_dir}/${var.error_document}")
  }

  provisioner "local-exec" {
    command = "aws cloudfront create-invalidation --distribution-id ${module.s3_static_website.cloudfront_distribution_id} --paths /index.html /error.html"

    environment = {
      AWS_ACCESS_KEY_ID     = var.aws_access_key_id
      AWS_SECRET_ACCESS_KEY = var.aws_secret_access_key
      AWS_DEFAULT_REGION    = var.aws_region
    }
  }

  depends_on = [module.s3_static_website]
}