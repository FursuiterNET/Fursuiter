from distutils.core import setup

setup(
    name='Fursuiter',
    version='0.0.0+dev014',
    packages=['Fursuiter', 'Fursuiter.sql', 'Fursuiter.sql.ORM', 'Fursuiter.views', 'Fursuiter.logging',
              'Fursuiter.storageengine', 'Fursuiter.authentication'],
    url='http://redmine.furstre.am/projects/fursuiter',
    license='',
    author='Dreae',
    author_email='penitenttangentt@gmail.com',
    description='Social networking site for fursuiters',
    install_requires=['pyramid', 'pyramid_beaker', 'pyramid_mako', 'python-swiftclient', 'sqlalchemy']
)
