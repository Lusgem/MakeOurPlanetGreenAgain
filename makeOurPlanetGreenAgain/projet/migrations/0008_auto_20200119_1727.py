# Generated by Django 2.2.7 on 2020-01-19 17:27

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('projet', '0007_auto_20200119_1723'),
    ]

    operations = [
        migrations.AlterField(
            model_name='projet',
            name='copyright',
            field=models.OneToOneField(blank=True, default=None, null=True, on_delete=django.db.models.deletion.CASCADE, to='copyright.Copyright'),
        ),
    ]
