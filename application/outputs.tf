# --- application/variables.tf ---
output "instance_id1" {
  # value = module.ec2_instance.*.id
  value = "${element(aws_instance.web_instance.*.id, 0)}"
}
output "instance_id2" {
  # value = module.ec2_instance.*.id
  value = "${element(aws_instance.web_instance.*.id, 1)}"
}

# output "web_sg" {
#   value = aws_security_group.web_sg
# }