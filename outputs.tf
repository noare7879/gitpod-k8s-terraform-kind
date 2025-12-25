output "namespace" {
  value = kubernetes_namespace.example.metadata[0].name
}

