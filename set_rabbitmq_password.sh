#!/bin/bash

if [ -f /.rabbitmq_password_set ]; then
	echo "RabbitMQ password already set!"
	exit 0
fi


echo "=> Securing RabbitMQ with ntipa/ntipa"
cat > /etc/rabbitmq/rabbitmq.config <<EOF
[
	{rabbit, [{default_user, <<"ntipa">>},{default_pass, <<"ntipa">>},{tcp_listeners, [{"0.0.0.0", 5672}]}]}
].
EOF

echo "=> Done!"
touch /.rabbitmq_password_set

echo "========================================================================"
echo "You can now connect to this RabbitMQ server using, for example:"
echo ""
echo "    curl --user ntipa:ntipa http://<host>:<port>/api/vhosts"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"
