from django.urls import path
from .views import (
    RegisterView,
    LoginView,
    VerifyEmailView,
    PasswordResetRequestView,
    PasswordResetConfirmView,
)

urlpatterns = [
    path('verify-email/<uidb64>/<token>/', VerifyEmailView.as_view(), name='email-verify'),
    path('register/', RegisterView.as_view(), name='register'),
    path('login/', LoginView.as_view(), name='login'),
    path('password-reset/', PasswordResetRequestView.as_view(), name='password-reset'),
    path('password-reset-confirm/<uidb64>/<token>/', PasswordResetConfirmView.as_view(), name='password-reset-confirm'),

]
