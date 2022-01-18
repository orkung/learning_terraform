output "container_id" {
  description = "id of docker container"
  value       = docker_container.nginx.id
}

output "image_id" {
  description = "id of image"
  value       = docker_image.nginx.id
}
