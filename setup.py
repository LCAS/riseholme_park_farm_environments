import os
from setuptools import setup
import glob

package_name = 'environment_template'

# Start with the static data_files entries
data_files = [
    ('share/ament_index/resource_index/packages', [f'resource/{package_name}']),
    (f'share/{package_name}', ['package.xml']),
    (f'share/{package_name}/config', ['config/environment.sh']),
    (f'share/{package_name}/config/location', glob.glob('config/location/*.*')),
    (f'share/{package_name}/config/metric', glob.glob('config/metric/*.*')),
    (f'share/{package_name}/config/topological', glob.glob('config/topological/*.*')),
    (f'share/{package_name}/config/world', glob.glob('config/world/*.*')),
]

# Optional recursive addition of custom_models if it exists
custom_models_path = 'config/world/custom_models'
if os.path.exists(custom_models_path):
    for root, _, files in os.walk(custom_models_path):
        if files:
            destination = os.path.join(f'share/{package_name}', root)
            file_list = [os.path.join(root, file) for file in files]
            data_files.append((destination, file_list))

setup(
    name=package_name,
    version='0.1.0',
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
