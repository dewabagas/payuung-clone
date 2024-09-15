import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payuung_clone/presentation/core/constants/styles.dart';
import 'package:payuung_clone/presentation/core/styles/app_colors.dart';
import 'package:payuung_clone/presentation/core/utils/common_utils.dart';
import 'package:payuung_clone/presentation/core/utils/extension/double_extension.dart';
import 'package:payuung_clone/presentation/shared/buttons/button_primary.dart';
import 'package:payuung_clone/presentation/shared/cards/card_general.dart';
import 'package:payuung_clone/presentation/shared/inputs/dropdown_primary.dart';
import 'package:payuung_clone/presentation/shared/inputs/input_primary.dart';
import 'package:payuung_clone/presentation/shared/pages/page_wrapper.dart';

class PagePersonalInformation extends StatefulWidget {
  @override
  State<PagePersonalInformation> createState() =>
      _PagePersonalInformationState();
}

class _PagePersonalInformationState extends State<PagePersonalInformation> {
  int activeStep = 0;
  PageController _pageController = PageController();

  TextEditingController dateController = TextEditingController();

  // State variables for dropdowns
  String? _selectedGender;
  String? _selectedEducation;
  String? _selectedMaritalStatus;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        dateController.text = formatDateDash(pickedDate.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return PageWrapper(
      appBarTitle: 'Informasi Pribadi',
      child: Column(
        children: [
          EasyStepper(
            activeStep: activeStep,
            stepRadius: 20.r,
            unreachedStepIconColor: AppColors.primary.withOpacity(0.2),
            unreachedStepBorderColor: AppColors.primary.withOpacity(0.2),
            unreachedStepTextColor: AppColors.primary.withOpacity(0.2),
            finishedStepBackgroundColor: AppColors.primary,
            finishedStepBorderColor: AppColors.primary,
            finishedStepBorderType: BorderType.normal,
            finishedStepIconColor: AppColors.primary,
            finishedStepTextColor: AppColors.primary,
            lineStyle: LineStyle(
              lineLength: screenWidth / 4,
              activeLineColor: AppColors.primary,
              defaultLineColor: AppColors.primary.withOpacity(0.2),
              lineThickness: 2,
              lineType: LineType.normal,
              unreachedLineColor: AppColors.primary.withOpacity(0.2),
              finishedLineColor: AppColors.primary,
              unreachedLineType: LineType.normal,
            ),
            activeStepBorderType: BorderType.normal,
            internalPadding: 0,
            showLoadingAnimation: false,
            defaultStepBorderType: BorderType.normal,
            activeStepBackgroundColor: AppColors.primary,
            activeStepBorderColor: AppColors.primary,
            activeStepIconColor: AppColors.primary,
            activeStepTextColor: AppColors.white,
            padding: EdgeInsets.zero,
            showStepBorder: false,
            onStepReached: (index) {
              setState(() {
                activeStep = index;
                _pageController.jumpToPage(index);
              });
            },
            steps: [
              EasyStep(
                customStep: _buildCustomStep(0, '1', activeStep),
                customTitle: Text('Biodata Diri',
                    textAlign: TextAlign.center,
                    style: TextStyles.regular12
                        .copyWith(color: AppColors.primary)),
              ),
              EasyStep(
                customStep: _buildCustomStep(1, '2', activeStep),
                customTitle: Text('Alamat\nPribadi',
                    textAlign: TextAlign.center,
                    style: TextStyles.regular12
                        .copyWith(color: AppColors.primary)),
              ),
              EasyStep(
                  customStep: _buildCustomStep(2, '3', activeStep),
                  customTitle: Center(
                      child: Text('Informasi\nPerusahaan',
                          textAlign: TextAlign.center,
                          style: TextStyles.regular12
                              .copyWith(color: AppColors.primary)))),
            ],
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activeStep = page;
                });
              },
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildBiodataForm(),
                      20.0.height,
                      _buildNextButton(),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildAddressForm(),
                      20.0.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: _buildPreviousButton()),
                          10.0.width,
                          Expanded(child: _buildNextButton()),
                        ],
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildCompanyInfoForm(),
                      20.0.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: _buildPreviousButton()),
                          10.0.width,
                          Expanded(child: _buildSaveButton()),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomStep(int stepIndex, String label, int activeStep) {
    bool isStepFinished = activeStep > stepIndex;
    bool isStepActive = activeStep == stepIndex;

    Color borderColor;
    BorderType borderType;

    if (isStepFinished) {
      // If step is finished, full border
      borderColor = AppColors.primary;
      borderType = BorderType.normal;
    } else if (isStepActive) {
      // If step is active, half border
      borderColor = AppColors.primary.withOpacity(0.5);
      borderType = BorderType.normal;
    } else {
      // If step is not reached
      borderColor = AppColors.primary.withOpacity(0.2);
      borderType = BorderType.normal;
    }

    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(label,
            style: TextStyles.regular14.copyWith(
              color: isStepFinished || isStepActive
                  ? AppColors.white
                  : AppColors.primary.withOpacity(0.5),
            )),
      ),
    );
  }

  // Button to move to the next step
  Widget _buildNextButton() {
    return ButtonPrimary(
        title: 'Selanjutnya',
        onPressed: () {
          setState(() {
            if (activeStep < 2) {
              activeStep++;
              _pageController.jumpToPage(activeStep);
            }
          });
        });
  }

  // Button to move to the previous step
  Widget _buildPreviousButton() {
    return ButtonPrimary(
        activeColor: AppColors.white,
        borderWidth: 1,
        borderColor: AppColors.primary,
        title: 'Sebelumnya',
        textColor: AppColors.primary,
        onPressed: () {
          setState(() {
            if (activeStep > 0) {
              activeStep--;
              _pageController.jumpToPage(activeStep);
            }
          });
        });
  }

  // Save button for the last step
  Widget _buildSaveButton() {
    return ButtonPrimary(title: 'Simpan', onPressed: () {});
  }

  // Form for step 1: Biodata Diri
  Widget _buildBiodataForm() {
    return Column(
      children: [
        InputPrimary(
          title: 'NAMA LENGKAP',
          hintText: 'Masukkan Nama Lengkap',
          isMandatory: true,
        ),
        16.0.height,
        GestureDetector(
            onTap: () => _selectDate(context),
            child: AbsorbPointer(
                child: InputPrimary(
              controller: dateController,
              hintText: 'Masukkan Tanggal Lahir',
              title: 'TANGGAL LAHIR',
              icon: const Icon(Icons.calendar_month, color: AppColors.neutral),
              isMandatory: true,
            ))),
        16.0.height,
        DropdownPrimary(
          value: _selectedGender,
          title: 'JENIS KELAMIN',
          items: ['Laki-laki', 'Perempuan'],
          hintText: 'Pilih Jenis Kelamin',
          onChanged: (newValue) {
            setState(() {
              _selectedGender = newValue;
            });
          },
          isMandatory: true,
        ),
        16.0.height,
        InputPrimary(
          title: 'ALAMAT EMAIL',
          hintText: 'Masukkan Alamat Email',
          isMandatory: true,
        ),
        16.0.height,
        InputPrimary(
          title: 'NO. HP',
          hintText: 'Masukkan No. HP',
          isMandatory: true,
        ),
        16.0.height,
        DropdownPrimary(
          value: _selectedGender,
          title: 'PENDIDIKAN',
          items: ['SD', 'SMP', 'SMA', 'D1', 'D2', 'D3', 'S1', 'S2', 'S3'],
          hintText: 'Pilih Pendidikan',
          onChanged: (newValue) {
            setState(() {
              _selectedGender = newValue;
            });
          },
        ),
        16.0.height,
        DropdownPrimary(
          value: _selectedGender,
          title: 'STATUS PERNIKAHAN',
          items: ['Belum Kawin', 'Kawin', 'Janda', 'Duda'],
          hintText: 'Pilih Status Pernikahan',
          onChanged: (newValue) {
            setState(() {
              _selectedGender = newValue;
            });
          },
        ),
      ],
    );
  }

  // Form for step 2: Alamat Pribadi
  Widget _buildAddressForm() {
    return Column(
      children: [
        CardGeneral(
            shadowOpacity: 0.1,
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                      decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Icon(Icons.call_to_action_rounded,
                          color: AppColors.primary, size: 20.w),
                    ),
                    8.0.width,
                    Text('Upload KTP', style: TextStyles.regular12),
                  ],
                ),
                16.0.height,
                InputPrimary(title: 'NIK', hintText: ''),
              ],
            )),
        16.0.height,
        InputPrimary(title: 'ALAMAT SESUAI KTP', hintText: ''),
        16.0.height,
        DropdownPrimary(
          value: _selectedGender,
          title: 'PROVINSI',
          items: ['SD', 'SMP', 'SMA', 'D1', 'D2', 'D3', 'S1', 'S2', 'S3'],
          hintText: 'Pilih',
          onChanged: (newValue) {
            setState(() {
              _selectedGender = newValue;
            });
          },
        ),
        16.0.height,
        DropdownPrimary(
          value: _selectedGender,
          title: 'KOTA/KABUPATEN',
          items: ['SD', 'SMP', 'SMA', 'D1', 'D2', 'D3', 'S1', 'S2', 'S3'],
          hintText: 'Pilih',
          onChanged: (newValue) {
            setState(() {
              _selectedGender = newValue;
            });
          },
        ),
        16.0.height,
        DropdownPrimary(
          value: _selectedGender,
          title: 'KECAMATAN',
          items: ['SD', 'SMP', 'SMA', 'D1', 'D2', 'D3', 'S1', 'S2', 'S3'],
          hintText: 'Pilih',
          onChanged: (newValue) {
            setState(() {
              _selectedGender = newValue;
            });
          },
        ),
        16.0.height,
        DropdownPrimary(
          value: _selectedGender,
          title: 'KELURAHAN',
          items: ['SD', 'SMP', 'SMA', 'D1', 'D2', 'D3', 'S1', 'S2', 'S3'],
          hintText: 'Pilih',
          onChanged: (newValue) {
            setState(() {
              _selectedGender = newValue;
            });
          },
        ),
        16.0.height,
        InputPrimary(title: 'KODE POS', hintText: ''),
        16.0.height,
        Row(
          children: [
            Checkbox(value: false, onChanged: (value) {}),
            Expanded(child: Text('Alamat domisili sama dengan alamat KTP'))
          ],
        ),
        16.0.height,
        InputPrimary(title: 'ALAMAT SESUAI KTP', hintText: ''),
        16.0.height,
        DropdownPrimary(
          value: _selectedGender,
          title: 'PROVINSI',
          items: ['SD', 'SMP', 'SMA', 'D1', 'D2', 'D3', 'S1', 'S2', 'S3'],
          hintText: 'Pilih',
          onChanged: (newValue) {
            setState(() {
              _selectedGender = newValue;
            });
          },
        ),
        16.0.height,
        DropdownPrimary(
          value: _selectedGender,
          title: 'KOTA/KABUPATEN',
          items: ['SD', 'SMP', 'SMA', 'D1', 'D2', 'D3', 'S1', 'S2', 'S3'],
          hintText: 'Pilih',
          onChanged: (newValue) {
            setState(() {
              _selectedGender = newValue;
            });
          },
        ),
        16.0.height,
        DropdownPrimary(
          value: _selectedGender,
          title: 'KECAMATAN',
          items: ['SD', 'SMP', 'SMA', 'D1', 'D2', 'D3', 'S1', 'S2', 'S3'],
          hintText: 'Pilih',
          onChanged: (newValue) {
            setState(() {
              _selectedGender = newValue;
            });
          },
        ),
        16.0.height,
        DropdownPrimary(
          value: _selectedGender,
          title: 'KELURAHAN',
          items: ['SD', 'SMP', 'SMA', 'D1', 'D2', 'D3', 'S1', 'S2', 'S3'],
          hintText: 'Pilih',
          onChanged: (newValue) {
            setState(() {
              _selectedGender = newValue;
            });
          },
        ),
        16.0.height,
        InputPrimary(title: 'KODE POS', hintText: ''),
      ],
    );
  }

  // Form for step 3: Informasi Perusahaan
  Widget _buildCompanyInfoForm() {
    return Column(
      children: [
        InputPrimary(title: 'NAMA USAHA / PERUSAHAAN', hintText: ''),
        16.0.height,
        InputPrimary(title: 'ALAMAT USAHA / PERUSAHAAN', hintText: ''),
        16.0.height,
        DropdownPrimary(
          value: _selectedGender,
          title: 'JABATAN',
          items: ['SD', 'SMP', 'SMA', 'D1', 'D2', 'D3', 'S1', 'S2', 'S3'],
          hintText: 'Pilih',
          onChanged: (newValue) {
            setState(() {
              _selectedGender = newValue;
            });
          },
        ),
        16.0.height,
        DropdownPrimary(
          value: _selectedGender,
          title: 'LAMA BEKERJA',
          items: ['SD', 'SMP', 'SMA', 'D1', 'D2', 'D3', 'S1', 'S2', 'S3'],
          hintText: 'Pilih',
          onChanged: (newValue) {
            setState(() {
              _selectedGender = newValue;
            });
          },
        ),
        16.0.height,
        DropdownPrimary(
          value: _selectedGender,
          title: 'SUMBER PENDAPATAN',
          items: ['SD', 'SMP', 'SMA', 'D1', 'D2', 'D3', 'S1', 'S2', 'S3'],
          hintText: 'Pilih',
          onChanged: (newValue) {
            setState(() {
              _selectedGender = newValue;
            });
          },
        ),
        16.0.height,
        DropdownPrimary(
          value: _selectedGender,
          title: 'PENDAPATAN KOTOR PER TAHUN',
          items: ['SD', 'SMP', 'SMA', 'D1', 'D2', 'D3', 'S1', 'S2', 'S3'],
          hintText: 'Pilih',
          onChanged: (newValue) {
            setState(() {
              _selectedGender = newValue;
            });
          },
        ),
        16.0.height,
        DropdownPrimary(
          value: _selectedGender,
          title: 'NAMA BANK',
          items: ['SD', 'SMP', 'SMA', 'D1', 'D2', 'D3', 'S1', 'S2', 'S3'],
          hintText: 'Pilih',
          onChanged: (newValue) {
            setState(() {
              _selectedGender = newValue;
            });
          },
        ),
        16.0.height,
        InputPrimary(title: 'CABANG BANK', hintText: ''),
        16.0.height,
        InputPrimary(title: 'NOMOR REKENING', hintText: ''),
      ],
    );
  }
}
