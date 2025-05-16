from django.core.mail import send_mail
from django.conf import settings
from django.urls import reverse
from django.utils.http import urlsafe_base64_encode
from django.utils.encoding import force_bytes
from django.contrib.auth.tokens import default_token_generator

def send_verification_email(user, request):
    uid = urlsafe_base64_encode(force_bytes(user.pk))
    token = default_token_generator.make_token(user)
    verification_link = request.build_absolute_uri(
        reverse('email-verify', kwargs={'uidb64': uid, 'token': token})
    )
    subject = "Verify your email"
    message = f"Click the link to verify your email:\n\n{verification_link}"
    send_mail(subject, message, settings.DEFAULT_FROM_EMAIL, [user.email])

def send_password_reset_email(user, request):
    uid = urlsafe_base64_encode(force_bytes(user.pk))
    token = default_token_generator.make_token(user)
    reset_link = request.build_absolute_uri(
        reverse('password-reset-confirm', kwargs={'uidb64': uid, 'token': token})
    )
    subject = "Reset your password"
    message = f"Click the link to reset your password:\n\n{reset_link}"
    send_mail(subject, message, settings.DEFAULT_FROM_EMAIL, [user.email])
