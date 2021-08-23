FROM public.ecr.aws/nginx/nginx:1.21-alpine

ADD conf/index.html /usr/share/nginx/index.template
ADD conf/default.conf /etc/nginx/conf.d/

ADD conf/hello.sh /docker-entrypoint.d/99-hello.sh
