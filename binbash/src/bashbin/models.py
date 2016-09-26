from __future__ import unicode_literals

from django.db import models

# Create your models here.
class User(models.Model):
    user_id = models.CharField(max_length=1000)
    question = models.IntegerField()
    level = models.IntegerField()
    last_correct_submit_timestamp = models.DateTimeField()
    last_login_timestamp = models.DateTimeField()
    cat_of_answer = models.TextField(blank=True, null=True)
    hack_attempts = models.IntegerField(default=0)
    disable_account = models.IntegerField(default=0) # 1 - disabled 0 enabled
    def __unicode__(self):
            return str(self.user_id)
class Question(models.Model):
    question_id = models.IntegerField()
    level_id = models.IntegerField()
    question_timestamp = models.DateTimeField()
    intro_to_level = models.TextField(blank=True, null=True)
    intro_to_question = models.TextField(blank=True, null=True)
    ls_cmd = models.TextField(blank=True, null=True)
    cat_of_question = models.TextField(blank=True, null=True)
    cat_of_file = models.TextField(blank=True, null=True)
    cat_of_testcase = models.TextField(blank=True, null=True)
    answer_md5 = models.TextField(blank=True, null=True)
    def __unicode__(self):
        return str("level-"+str(self.level_id)+" Question-"+str(self.question_id))