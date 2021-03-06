# Generated by Django 2.2.5 on 2020-01-18 23:24

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('plateforme', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='comment',
            name='id',
        ),
        migrations.AlterField(
            model_name='comment',
            name='projet',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='projet.Projet'),
        ),
        migrations.AlterField(
            model_name='comment',
            name='utilisateur',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
    ]
