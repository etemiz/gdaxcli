from distutils.core import setup
from setuptools import find_packages

setup(
    name = 'gdaxcli',
    packages = find_packages('gdaxcli', exclude=['tests']),
    version = '0.1',
    description = 'Commandline client for trading on GDAX',
    author = 'Son Pham',
    author_email = 'sp@sonpham.me',
    url = 'https://github.com/sonph/gdaxcli',
    download_url = 'https://github.com/sonph/gdaxcli/archive/0.1.0.zip',
    keywords = ['gdax', 'cli', 'tool', 'client', 'cryptocurrency', 'bitcoin',
      'ethereum', 'trading'],
    classifiers = [],
    install_requires = [
      # TODO: sync this with requirements.txt
      "gdax",
      "tabulate",
      "colorama",
    ]
)

# To upload to testpypi.python.org:
# python setup.py register -r pypitest
# python setup.py sdist upload -r pypitest

# To upload to pypi.python.org:
# python setup.py register -r pypi
# python setup.py sdist upload -r pypi
