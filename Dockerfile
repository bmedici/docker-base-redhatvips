FROM centos:7

MAINTAINER Bruno MEDICI <opensource@bmconseil.com>
ENV VIPS_VERSION=8.7.4
ENV VIPS_URL=https://github.com/libvips/libvips/releases/download

# Install Node 10 sources
RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash -
RUN yum install -y nodejs 

# Install libvips
WORKDIR /usr/local/src
RUN yum install -y gcc make wget gcc-c++ libpng-devel glib2-devel libjpeg-devel expat-devel zlib-devel
RUN wget ${VIPS_URL}/v${VIPS_VERSION}/vips-${VIPS_VERSION}.tar.gz && \
  tar xzf vips-${VIPS_VERSION}.tar.gz && \
	cd vips-${VIPS_VERSION} && \
	./configure && \
  make && \
  make install

# Define default command.
# CMD ["rabbitmq-start"]
