# Kubernetes Mutating Webhook
A Kubernetes mutating admission webhook, written using Python and FastAPI.

I've written a [blog post that explains the whole set up.](https://kmitevski.com/kubernetes-mutating-webhook-with-python-and-fastapi)

The webhook will add a `nodeSelector` label when a Deployment, StatefulSet, or DaemonSet is created.

The required `nodeSelector` is set through the `NODE_POOL` environment variable in the webhook deployment file.

```
env:
- name: NODE_POOL
  value: "kubernetes.io/hostname: docker-desktop"
```

Example:
```
kubectl apply -f tests.yaml

deployment.apps/nginx-deployment created
statefulset.apps/nginx-sts created
```

```
[2022-11-06 21:50:08,723] INFO: Applying nodeSelector for Deployment/nginx-deployment.
[2022-11-06 21:50:08,723] INFO: Got 'kubernetes.io/hostname: docker-desktop' as nodeSelector label, patching pods...
INFO:     192.168.65.3:33852 - "POST /mutate?timeout=20s HTTP/1.1" 200 OK
[2022-11-06 21:50:08,785] INFO: Applying nodeSelector for StatefulSet/nginx-sts.
[2022-11-06 21:50:08,786] INFO: Got 'kubernetes.io/hostname: docker-desktop' as nodeSelector label, patching pods...
```
