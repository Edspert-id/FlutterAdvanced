import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance/src/domain/entities/registration_model.dart';
import 'package:flutter_advance/src/domain/usecases/upload_file_usecase.dart';
import 'package:flutter_advance/src/presentation/screens/base_screen.dart';
import 'package:flutter_advance/src/presentation/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../bloc/auth/auth_bloc.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController namaLengkapController = TextEditingController();
  final TextEditingController namaSekolahController = TextEditingController();

  XFile? _selectedImage;
  String? _uploadedImageUrl;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) =>
          (previous is UploadProfilePicLoading &&
              current is UploadProfilePicSuccess) ||
          (previous is RegistrationLoading && current is RegistrationSuccess),
      listener: (context, state) {
        if (state is UploadProfilePicSuccess) {
          print('File Uploaded to ${state.downloadUrl}');
          _callRegisterEvent();
        }

        if (state is RegistrationSuccess) {
          print('Register success!');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BaseScreen(),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: _uploadedImageUrl == null && _selectedImage == null
                        ? Container(
                            height: 100,
                            width: 100,
                            color: Colors.grey,
                          )
                        : (_uploadedImageUrl != null)
                            ? Image.network(
                                _uploadedImageUrl!,
                                height: 100,
                                width: 100,
                              )
                            : Image.file(
                                File(_selectedImage!.path),
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: InkWell(
                        onTap: () async {
                          XFile? file = await ImagePicker().pickImage(
                            source: ImageSource.camera,
                            imageQuality: 60,
                          );

                          setState(() {
                            _selectedImage = file;
                          });
                        },
                        child: const Icon(
                          Icons.edit_outlined,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Email'),
                ),
                controller: TextEditingController(
                    text: FirebaseAuth.instance.currentUser?.email),
                enabled: false,
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Nama Lengkap'),
                ),
                controller: namaLengkapController,
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Nama Sekolah'),
                ),
                controller: namaSekolahController,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_selectedImage != null) {
                    final String fileExt = _selectedImage!.path.split('.').last;
                    final String fileName =
                        '${DateTime.now().millisecondsSinceEpoch}.$fileExt';
                    context.read<AuthBloc>().add(UploadProfilePictureEvent(
                          params: UploadFileParams(
                            fileName: fileName,
                            fileByte: await _selectedImage!.readAsBytes(),
                          ),
                        ));
                  } else {
                    _callRegisterEvent();
                  }
                },
                child: const Text('REGISTER'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _callRegisterEvent([String? profilePicUrl]) {
    context.read<AuthBloc>().add(RegisterUserEvent(
          data: RegistrationModel(
            namaLengkap: namaLengkapController.text,
            email: FirebaseAuth.instance.currentUser!.email!,
            namaSekolah: namaSekolahController.text,
            kelas: '11',
            gender: 'Laki-laki',
            foto: profilePicUrl,
            jenjang: 'SMA',
          ),
        ));
  }
}
