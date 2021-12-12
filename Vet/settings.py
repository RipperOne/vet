"""
Django settings for Vet project.

Generated by 'django-admin startproject' using Django 2.2.4.

For more information on this file, see
https://docs.djangoproject.com/en/2.2/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/2.2/ref/settings/
"""

from django.db import models

import os
if os.name == 'nt':
    import platform
    OSGEO4W = r"C:\OSGeo4W"
    if '64' in platform.architecture()[0]:
        OSGEO4W += "64"
    assert os.path.isdir(OSGEO4W), "Directory does not exist: " + OSGEO4W
    os.environ['OSGEO4W_ROOT'] = OSGEO4W
    os.environ['GDAL_DATA'] = "C:\Program Files\GDAL\gdal-data"
    os.environ['PROJ_LIB'] = OSGEO4W + r"\share\proj"
    GDAL_LIBRARY_PATH = r'C:\Program Files\GDAL\gdal204'
    os.environ['PATH'] = OSGEO4W + r"\bin;" + os.environ['PATH']

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/2.2/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = os.environ.get('DJANGO_SECRET_KEY', 'rt7rr0uo82%@!6m2#6a1#(+84r#o!eua1mjh_w(0eady#fik7j')

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = bool(os.environ.get('DJANGO_DEBUG', True))

ALLOWED_HOSTS = ['*']

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'vet.settings')

# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.sites',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.gis',
    'apps.accounts.apps.AccountsConfig',

    'allauth',
    'allauth.account',
    'bootstrap3',
    'django_extensions',
    'datetimewidget',
    'menu',
    'django_filters',
    'django_tables2',
    'debug_toolbar',
    'leaflet',
    'djgeojson',
    'osgeo',
    'smart_selects',

    'apps.home',
    'apps.users',
    'apps.utils',
    'apps.main',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'debug_toolbar.middleware.DebugToolbarMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.middleware.locale.LocaleMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'Vet.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates'), os.path.join(BASE_DIR, 'templates', 'allauth')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'Vet.wsgi.application'

SITE_ID = 1

# Database
# https://docs.djangoproject.com/en/2.2/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.contrib.gis.db.backends.postgis',
        'NAME': 'vet',
        'USER': 'postgres',
        'PASSWORD': 'postgres',
        'HOST': 'localhost',
        'PORT': '5432',
    }
}

CRISPY_TEMPLATE_PACK = 'bootstrap4'

JQUERY_URL = True

# Password validation
# https://docs.djangoproject.com/en/2.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

# Logging
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'simple': {
            'format': '%(levelname)s %(message)s'
        },
    },
    'handlers': {
        'console': {
            'level': 'DEBUG',
            'class': 'logging.StreamHandler',
            'formatter': 'simple'
        },
    },
    'loggers': {
        'main': {
            'handlers': ['console'],
            'level': 'DEBUG',
            'propagate': True,
        },
    },
}

# Internationalization
# https://docs.djangoproject.com/en/2.2/topics/i18n/

LANGUAGE_CODE = 'es-CL'

TIME_ZONE = 'America/Santiago'

USE_I18N = True

USE_L10N = True

USE_TZ = True

LEAFLET_CONFIG = {
    'DEFAULT_CENTER': (-36.60754, -72.10293),
    'DEFAULT_ZOOM': 12,
    'MAX_ZOOM': 17,
    'MIN_ZOOM': 3,
    'SCALE': 'both',
    'ATTRIBUTION_PREFIX': 'Copyright INACAP'
}

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/2.2/howto/static-files/

STATIC_URL = '/static/'

STATICFILES_DIRS = (
    os.path.join(BASE_DIR, 'static'),
)

MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

# Email
EMAIL_USE_TLS = True
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_PORT = 587
EMAIL_HOST_USER = 'example@gmail.com'
EMAIL_HOST_PASSWORD = 'example'
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'

DATE_INPUT_FORMATS = (
    "%d-%m-%Y", "%d/%m/%Y", "%Y-%m-%d", "%Y/%m/%d",  # '08-08-2019', '08/08/2019', '2019-08-08', '2019/08/08'
)

DATE_FORMAT = "%d-%m-%Y"

DJANGO_TABLES2_TEMPLATE = 'django_tables2/bootstrap-responsive.html'

AUTH_USER_MODEL = "users.User"

ACCOUNT_SIGNUP_FORM_CLASS = 'apps.users.forms.UserCreationForm'

FILTERS_VERBOSE_LOOKUPS = {
    'exact': '',
    'iexact': '',
    'contains': '',
    'icontains': '',
}

LOGIN_REDIRECT_URL = "home:home"

AUTHENTICATION_BACKENDS = (
    # Necesario para logear por username en Django admin, sin importar allauth
    'django.contrib.auth.backends.ModelBackend',

    # Metodo de autenticación especifico de allauth, como logear por email
    'allauth.account.auth_backends.AuthenticationBackend',
)

ACCOUNT_EMAIL_VERIFICATION = "none"
