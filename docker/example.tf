
provider "docker" {
    host = "tcp://127.0.0.1:1234/"
}

# Create a container
resource "docker_container" "foo53" {
    image = "${docker_image.haproxy.latest}"
    name = "foo53"
    ports {
		internal = "80"
		external = "81"
		ip = "${var.localIP}"
	}
    volumes {
		host_path = "/opt/haproxy"
		container_path = "/etc/haproxy"
    }

}

# Create a container
resource "docker_container" "foo54" {
    image = "${docker_image.haproxy.latest}"
    name = "foo54"
}


resource "docker_container" "hoge" {
    image = "${docker_image.centos.latest}"
    name = "hoge"
    hostname = "hoge"
    command = ["/bin/sh", "-c", "while true ; do sleep 1; hostname -s ; done"]
}


resource "docker_image" "haproxy" {
    name = "docker.io/mareksr/haproxy:v2"
}

resource "docker_image" "centos" {
    name = "docker.io/centos:latest"
}


