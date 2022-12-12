# README

Requisitos

Ruby (2.7 o superior)
Ruby on Rails 7.0.4
SQLite

Instalación

git clone https://github.com/lautarocurotto/Trabajo-Integrador-TTPS.git

rake db:migrate

rails db:seed

bundle install

bundle exec rails server

Usuarios default

Usuario: admin@admin.com
Contraseña: administrador

Usuario: personal@personal.com
Contraseña: personalbancario

Decisiones de diseño

Opté por modelar los roles del usuario agregando una columna a la tabla usuario porque es la manera recomendada cuando los usuarios tienen un solo rol asignado. El manejo de permisos lo hice manualmente ya que no me pareció necesario para la magnitud del proyecto usar la clase ability de cancancan. Los horarios los modelé con una tabla con campo día_inicio, día_fin porque si utilizo un array rompo 1FN y solo lo permite postgresql.