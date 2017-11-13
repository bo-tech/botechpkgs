import os
from taiga.users.models import User

ENV_USER = 'TAIGA_DJANGO_USERNAME'
ENV_PASSWORD = 'TAIGA_DJANGO_PASSWORD'


username = os.getenv(ENV_USER)
password = os.getenv(ENV_PASSWORD)
assert username, 'Username is missing to set password'
assert password, 'Password is missing to set password'

admin = User.objects.get(username=username)
admin.set_password(password)
admin.save()
