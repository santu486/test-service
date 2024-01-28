# test-service
test-service

**podman build/run:**
<br />

(sudo) podman build -t hello-world:v0 .
<br />
(sudo) podman run -p 8080:8080 hello-world:v3
<br />
Should run with non-root user aslo

**Error building image on rhel8:**
<br />

Error relocating /lib/ld-musl-x86_64.so.1: RELRO protection failed: No error information
<br />
Error relocating /__cacert_entrypoint.sh: RELRO protection failed: No error information
<br />
**Resolution:**
<br />

sudo setenforce 0

**app endpoint:**
<br />
http://<host-ip>:8080/greet
