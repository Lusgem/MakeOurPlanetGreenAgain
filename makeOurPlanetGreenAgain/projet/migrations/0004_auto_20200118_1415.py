# Generated by Django 2.2.7 on 2020-01-18 14:15

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('projet', '0003_auto_20200118_1108'),
    ]

    operations = [
        migrations.RenameField(
            model_name='projet',
            old_name='somme',
            new_name='montant',
        ),
    ]
