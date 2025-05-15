from django.urls import path
from .views import RegisterView, LoginView
from .views import VerifyEmailView

urlpatterns = [
    path('verify-email/<uidb64>/<token>/', VerifyEmailView.as_view(), name='email-verify'),
    path('register/', RegisterView.as_view(), name='register'),
    path('login/', LoginView.as_view(), name='login'),
]