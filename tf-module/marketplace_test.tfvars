deployment_name           = "test-activemq"
namespace                 = "test-namespace"
persistence_storage_class = "standard"
admin_bind_all_hosts      = true
persistence_size          = "10Gi"

# Note: The Marketplace validation engine will automatically 
# override these three with the actual values it generates 
# during the test, but they must be present to pass the check.
console_password          = "test-password-123"
image_repo                = "us-docker.pkg.dev/cloud-marketplace-ops/gcr.io/activemq6"
image_tag                 = "6.1"