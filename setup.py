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
<<<<<<< HEAD
    data_files=[
        ('share/ament_index/resource_index/packages', [f'resource/{package_name}']),
        (f'share/{package_name}', ['package.xml']),
        (f'share/{package_name}/config', ['config/environment.sh']),
        (f'share/{package_name}/config/location', glob.glob('config/location/*.*')),
        (f'share/{package_name}/config/metric', glob.glob('config/metric/*.*')),
        (f'share/{package_name}/config/metric/map', glob.glob('config/metric/map/*.*')),
        (f'share/{package_name}/config/metric/nogo', glob.glob('config/metric/nogo/*.*')),
        (f'share/{package_name}/config/topological', glob.glob('config/topological/*.*')),
        (f'share/{package_name}/config/world', glob.glob('config/world/*.*')),
    ],
=======
    data_files=data_files,
>>>>>>> 68bcf1783ff898ca8ce165273e63c87a587d023c
    zip_safe=True,
    maintainer='james',
    maintainer_email='primordia@live.com',
    description='instance of basic template for standardised map referencing across digital twins',
)
