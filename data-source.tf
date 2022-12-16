data "external" "machine_name" {
  program = ["python3", "${path.module}/external/name-generator.py"]
}