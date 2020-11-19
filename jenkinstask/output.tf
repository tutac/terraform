
output "DNS" {
    value = "${aws_route53_record.www.name}"
}

output "username" {
    value = "hasan"
}

output "passwd" {
    value = "fenerbahce"
}