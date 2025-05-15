from rest_framework import generics, status
from rest_framework.response import Response
from .serializers import RegisterSerializer, LoginSerializer
from rest_framework.views import APIView
from django.contrib.auth import login
from django.contrib.auth import get_user_model
from django.utils.http import urlsafe_base64_decode
from django.contrib.auth.tokens import default_token_generator  # Import default_token_generator
from django.http import HttpResponse  # Import HttpResponse to send the response

User = get_user_model()

class VerifyEmailView(APIView):
    def get(self, request, uidb64, token):
        try:
            # Decode the UID from the URL
            uid = urlsafe_base64_decode(uidb64).decode()
            user = User.objects.get(pk=uid)
        except (TypeError, ValueError, OverflowError, User.DoesNotExist):
            user = None

        if user and default_token_generator.check_token(user, token):
            # Mark the user as active (email verified)
            user.is_active = True
            user.save()
            return HttpResponse("✅ Email verified successfully.")
        return HttpResponse("❌ Invalid or expired verification link.")

class RegisterView(generics.CreateAPIView):
    serializer_class = RegisterSerializer

class LoginView(APIView):
    def post(self, request):
        serializer = LoginSerializer(data=request.data)
        if serializer.is_valid():
            user = serializer.validated_data

            if not user.is_active:
                return Response({"error": "Account not verified. Please check your email for verification."}, status=status.HTTP_400_BAD_REQUEST)
            
            login(request, user)
            return Response({"message": "Login successful"})
        
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
