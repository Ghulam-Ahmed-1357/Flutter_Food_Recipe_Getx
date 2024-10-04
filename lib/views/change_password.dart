import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_food_recipe/controllers/recipe_controller.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});
  RecipeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.changePasswordFormKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => TextFormField(
                    controller: controller.currentPasswordController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Current Password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller
                              .isObscure(controller.current_password_isobscure);
                        },
                        icon: Icon(
                          controller.current_password_isobscure.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    obscureText: controller.current_password_isobscure.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your current password";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => TextFormField(
                    controller: controller.newPasswordController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "New Password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller
                              .isObscure(controller.new_password_isobscure);
                        },
                        icon: Icon(
                          controller.new_password_isobscure.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    obscureText: controller.new_password_isobscure.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your new password";
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters long";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => TextFormField(
                    controller: controller.confirmNewPasswordController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Confirm New Password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.isObscure(
                              controller.confirm_new_password_isobscure);
                        },
                        icon: Icon(
                          controller.confirm_new_password_isobscure.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    obscureText:
                        controller.confirm_new_password_isobscure.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please confirm your new password";
                      }
                      if (value != controller.newPasswordController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  controller.changePassword(context);
                },
                child: Text('Change Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
