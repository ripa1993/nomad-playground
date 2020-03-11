# A simple Spring Boot application from https://github.com/spring-guides/gs-spring-boot.git

job "java" {
  datacenters = ["dc1"]
  task "webservice" {
    driver = "java"

    config {
      jar_path    = "local/spring-boot-0.0.1-SNAPSHOT.jar"
      jvm_options = ["-Xmx2048m", "-Xms256m"]
      args        = ["--server.port=${NOMAD_PORT_http}"]
    }

    artifact {
      source = "https://paste.c-net.org/WalterRocking"
      destination = "local/spring-boot-0.0.1-SNAPSHOT.jar"
      mode = "file"
    }

    resources {
      network {
        port "http" {}
      }
    }

    service {
      tags = [ "web" ]
      port = "http"
      check {
        type = "http"
        port = "http"
        path = "/actuator/health"
        interval = "5s"
        timeout = "2s"
      }
    }
  }
}