from django.contrib import admin

# Register your models here.
from .models import User, Question

class QuestionAdmin(admin.ModelAdmin):
	pass
class UserAdmin(admin.ModelAdmin):
    pass
admin.site.register(User, UserAdmin)
admin.site.register(Question, QuestionAdmin)