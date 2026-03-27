import os
from setuptools import setup

package_name = 'environment_template'

data_files = [
    ('share/ament_index/resource_index/packages', [f'resource/{package_name}']),
    (f'share/{package_name}', ['package.xml']),
]

def add_tree(source_dir):
    if os.path.exists(source_dir):
        for root, _, files in os.walk(source_dir):
            if files:
                destination = os.path.join('share', package_name, root)
                file_list = [os.path.join(root, f) for f in files]
                data_files.append((destination, file_list))

add_tree('config')

setup(
    name=package_name,
    version='1.0.3',
    packages=[package_name],
    data_files=data_files,
    zip_safe=True,
    maintainer='james',
    maintainer_email='primordia@live.com',
    description='instance of basic template for standardised map referencing across digital twins',
)
