FROM gcc AS build
WORKDIR /tmp

COPY noop.c .
RUN gcc noop.c -static -o noop

FROM scratch
MAINTAINER Jan Nash <jnash@jnash.de>

COPY --from=build /tmp/noop /
CMD ["/noop"]
