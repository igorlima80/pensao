MenuItem.delete_all

admin = MenuItem.create name: 'Admin', icon: 'bars', link: '#', position: 99, target: '_self', permission: 'manage', permission_check: 'all', published: true, active_test: "controller_name == 'all'"
MenuItem.create name: 'Usuários', icon: 'users', link: 'users_path', position: 4, target: '_self', permission: 'manage', permission_check: 'User', menu_item: admin, published: true, active_test: "controller_name == 'users'"
MenuItem.create name: 'Estados', icon: 'map', link: 'states_path', position: 12, target: '_self', permission: 'manage', permission_check: 'State', menu_item: admin, published: true, active_test: "controller_name == 'states'"
MenuItem.create name: 'Cidades', icon: 'map-o', link: 'cities_path', position: 13, target: '_self', permission: 'manage', permission_check: 'City', menu_item: admin, published: true, active_test: "controller_name == 'cities'"
