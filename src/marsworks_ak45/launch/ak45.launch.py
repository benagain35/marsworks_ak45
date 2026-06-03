import os
from launch import LaunchDescription
from launch.actions import TimerAction
from launch_ros.actions import Node
from ament_index_python.packages import get_package_share_directory
import xacro

def generate_launch_description():
    pkg = get_package_share_directory("marsworks_ak45")
    xacro_file = os.path.join(pkg, "urdf", "ak45.urdf.xacro")
    robot_description = xacro.process_file(xacro_file).toxml()
    controllers_yaml = os.path.join(pkg, "config", "controllers.yaml")

    control_node = Node(
        package="controller_manager",
        executable="ros2_control_node",
        parameters=[
            {"robot_description": robot_description},
            controllers_yaml,
        ],
        output="screen",
    )

    joint_state_spawner = Node(
        package="controller_manager",
        executable="spawner",
        arguments=[
            "joint_state_broadcaster",
            "--controller-manager", "/controller_manager",
            "--controller-manager-timeout", "10",
        ],
        output="screen",
    )

    trajectory_spawner = Node(
        package="controller_manager",
        executable="spawner",
        arguments=[
            "joint_trajectory_controller",
            "--controller-manager", "/controller_manager",
            "--controller-manager-timeout", "10",
            "--inactive",
        ],
        output="screen",
    )

    return LaunchDescription([
        control_node,

        TimerAction(
            period=2.0,
            actions=[joint_state_spawner],
        ),

        TimerAction(
            period=4.0,
            actions=[trajectory_spawner],
        ),
    ])