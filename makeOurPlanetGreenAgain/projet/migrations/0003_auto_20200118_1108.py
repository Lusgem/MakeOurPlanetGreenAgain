# Generated by Django 2.2.7 on 2020-01-18 11:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('projet', '0002_projet_publication_date'),
    ]

    operations = [
        migrations.AlterField(
            model_name='projet',
            name='description',
            field=models.CharField(max_length=1000),
        ),
    ]
