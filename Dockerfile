FROM ghcr.io/opentofu/opentofu:minimal AS tofu
FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add --no-cache git aws-cli curl

COPY --from=tofu /usr/local/bin/tofu /usr/local/bin/tofu 
RUN ln -s /usr/local/bin/tofu /usr/local/bin/terraform

# Create working directory
WORKDIR /workspace

# Verify installations
RUN git --version && \
    aws --version && \
    tofu version && \
    curl --version

# Set default shell to bash
SHELL ["/bin/bash", "-c"]

# Default command
CMD ["/bin/bash"]
