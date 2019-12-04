# Generated by Django 2.2.7 on 2019-12-04 11:10

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Expert',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('karma', models.IntegerField()),
                ('utilisateur', models.ManyToManyField(to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
