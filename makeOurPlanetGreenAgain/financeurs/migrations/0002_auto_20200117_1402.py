# Generated by Django 2.2.7 on 2020-01-17 14:02

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('financeurs', '0001_initial'),
        ('projet', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='financeur',
            name='projetsfinances',
            field=models.ManyToManyField(to='projet.Projet'),
        ),
        migrations.AddField(
            model_name='financeur',
            name='utilisateur',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
    ]
