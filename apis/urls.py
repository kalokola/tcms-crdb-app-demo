from django.urls import path
from . import views

urlpatterns = [
    path('', views.getNotes),
    path('notes/create/', views.createNote),
    path('notes/<str:pk>/update/', views.updateNote),
    path('notes/<str:pk>/detail/', views.getNote),
    path('notes/<str:pk>/delete/', views.deleteNote)
]