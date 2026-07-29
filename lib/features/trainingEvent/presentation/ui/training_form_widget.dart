import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:nuevosol/features/trainingEvent/model/training_employee.dart';
import 'package:nuevosol/features/trainingEvent/presentation/bloc/bloc_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/trainingEvent/presentation/bloc/create_training_cubit/create_training_cubit.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/widgets/input_filed.dart';
import 'package:nuevosol/widgets/spaced_column.dart';

class TrainingFormWidget extends StatefulWidget {
  const TrainingFormWidget({super.key});

  @override
  State<TrainingFormWidget> createState() => _TrainingFormWidgetState();
}

class _TrainingFormWidgetState extends State<TrainingFormWidget> {
  final Set<int> _selectedRows = {};

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTrainingCubit, CreateTrainingState>(
      builder: (context, formState) {
        final form = formState.form;
        $logger.devLog('form.........$form');

        final userRoles = context.user.role ?? [];
        final isHod = userRoles.any(
          (r) => r.toString().toLowerCase().contains('hr user'),
        );
        final isTrainer = userRoles.any(
          (r) => r.toString().toLowerCase().contains('trainer'),
        );
        $logger.devLog('trainer....$isTrainer');
        final showQr = (isHod || isTrainer) && (form.name?.isNotEmpty ?? false);

        return SpacedColumn(
          margin: const EdgeInsets.all(12.0),
          defaultHeight: 8,
          children: [
            if (showQr) ...[
              Center(
                child: Column(
                  children: [
                    Text(
                      'Scan to join this training',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.event),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: QrImageView(
                        data: form.name!,
                        size: 200,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      form.name!,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
            InputField(
              title: 'Training Program',
              readOnly: true,
              isRequired: true,
              initialValue: form.trainingProgram,
              borderColor: AppColors.event,
              onChanged: (no) {
                context.cubit<CreateTrainingCubit>().onValueChanged(
                  trainingProgram: no,
                );
              },
            ),
            InputField(
              title: 'Event Status',
              readOnly: true,
              hintText: 'Enter Invoice Number',
              isRequired: true,
              initialValue: form.eventStatus,
              borderColor: AppColors.event,
              onChanged: (invNumber) {
                context.cubit<CreateTrainingCubit>().onValueChanged(
                  eventStatus: invNumber,
                );
              },
            ),
            InputField(
              title: 'Type',
              readOnly: true,
              initialValue: form.type,
              borderColor: AppColors.event,
              minLines: 1,
              onChanged: (type) {
                context.cubit<CreateTrainingCubit>().onValueChanged(type: type);
              },
            ),
            InputField(
              title: 'Company',
              readOnly: true,
              initialValue: form.company,
              borderColor: AppColors.event,
              minLines: 1,
              onChanged: (company) {
                context.cubit<CreateTrainingCubit>().onValueChanged(
                  company: company,
                );
              },
            ),
            InputField(
              title: 'Trainer',
              readOnly: true,
              initialValue: form.trainerName,
              borderColor: AppColors.event,
              minLines: 1,
              onChanged: (trainerName) {
                context.cubit<CreateTrainingCubit>().onValueChanged(
                  trainerName: trainerName,
                );
              },
            ),
            InputField(
              title: 'Supplier',
              readOnly: true,
              initialValue: form.supplier,
              borderColor: AppColors.event,
              minLines: 1,
              onChanged: (supplier) {
                context.cubit<CreateTrainingCubit>().onValueChanged(
                  supplier: supplier,
                );
              },
            ),
            InputField(
              title: 'Traininer Email',
              readOnly: true,
              initialValue: form.trainerEmail,
              borderColor: AppColors.event,
              minLines: 1,
              onChanged: (trainerEmail) {
                context.cubit<CreateTrainingCubit>().onValueChanged(
                  trainerEmail: trainerEmail,
                );
              },
            ),
            InputField(
              title: 'Contact',
              readOnly: true,
              initialValue: form.contactNumber,
              borderColor: AppColors.event,
              minLines: 1,
              onChanged: (contactNumber) {
                context.cubit<CreateTrainingCubit>().onValueChanged(
                  contactNumber: contactNumber,
                );
              },
            ),
            InputField(
              title: 'Course',
              readOnly: true,
              initialValue: form.course,
              borderColor: AppColors.event,
              minLines: 1,
              onChanged: (course) {
                context.cubit<CreateTrainingCubit>().onValueChanged(
                  course: course,
                );
              },
            ),
            InputField(
              title: 'Location',
              readOnly: true,
              initialValue: form.location,
              borderColor: AppColors.event,
              minLines: 1,
              onChanged: (location) {
                context.cubit<CreateTrainingCubit>().onValueChanged(
                  location: location,
                );
              },
            ),
            InputField(
              title: 'Start Time',
              readOnly: true,
              initialValue: form.startTime,
              borderColor: AppColors.event,
              minLines: 1,
              onChanged: (startTime) {
                context.cubit<CreateTrainingCubit>().onValueChanged(
                  startTime: startTime,
                );
              },
            ),
            InputField(
              title: 'End Time',
              readOnly: true,
              initialValue: form.endTime,
              borderColor: AppColors.event,
              minLines: 1,
              onChanged: (endTime) {
                context.cubit<CreateTrainingCubit>().onValueChanged(
                  endTime: endTime,
                );
              },
            ),
            const SizedBox(height: 20),

            Text('Employees', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),

            BlocBuilder<Employess, EmployessState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const SizedBox(
                    height: 250,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final employees = state.maybeWhen(
                  success: (data) => data,
                  orElse: () => <TrainingEmployee>[],
                );

                if (employees.isEmpty) {
                  return const SizedBox(
                    height: 150,
                    child: Center(child: Text('No employees joined yet')),
                  );
                }

                return SizedBox(
                  height: 260,
                  width: double.infinity,
                  child: _employeeTable(employees),
                );
              },
            ),

            const SizedBox(height: 12),

            // if (!isCompleted) ...[
            //   AppButton(
            //     label: isCreating ? 'Save' : 'Submit',
            //     isLoading: formState.isLoading,
            //     bgColor: AppColors.haintBlue,
            //     margin: const EdgeInsets.all(12.0),
            //     onPressed: context.cubit<CreateTrainingCubit>().save,
            //   ),
            // ],
          ],
        );
      },
    );
  }

  Widget _employeeTable(List<TrainingEmployee> employees) {
    final screenWidth = MediaQuery.of(context).size.width;
    final tableMinWidth = screenWidth < 700 ? 700.0 : screenWidth - 24;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: DataTable2(
          columnSpacing: 16,
          horizontalMargin: 12,
          minWidth: tableMinWidth,
          headingRowHeight: 44,
          dataRowHeight: 46,
          border: TableBorder(
            top: BorderSide(color: Colors.grey.shade300),
            bottom: BorderSide(color: Colors.grey.shade300),
            left: BorderSide(color: Colors.grey.shade300),
            right: BorderSide(color: Colors.grey.shade300),
            horizontalInside: BorderSide(color: Colors.grey.shade300),
            verticalInside: BorderSide(color: Colors.grey.shade300),
          ),
          headingRowColor: WidgetStateProperty.all(Colors.grey.shade100),
          columns: const [
            DataColumn2(fixedWidth: 45, label: Text('No.')),
            DataColumn2(size: ColumnSize.L, label: Text('Employee')),
            DataColumn2(size: ColumnSize.S, label: Text('Status')),
            DataColumn2(size: ColumnSize.S, label: Text('Attendance')),
            DataColumn2(size: ColumnSize.S, label: Text('Is Mandatory')),
          ],
          rows: List.generate(employees.length, (index) {
            final e = employees[index];
            final selected = _selectedRows.contains(index);

            return DataRow(
              selected: selected,
              cells: [
                DataCell(Text('${index + 1}')),
                DataCell(Text(e.employeeName ?? '')),
                DataCell(Text(e.status ?? 'Completed')),
                DataCell(Text(e.attendance ?? 'Present')),
                DataCell(
                  Checkbox(value: e.isMandatory == 1, onChanged: (_) {}),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
class QrScannerPage extends StatefulWidget {
  const QrScannerPage({super.key});

  @override
  State<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  bool _handled = false;

  void _onDetect(BarcodeCapture capture) {
    if (_handled) return; // ignore any further frames

    final barcode = capture.barcodes.first;
    final value = barcode.rawValue;
    if (value != null && value.isNotEmpty) {
      _handled = true;
      Navigator.pop(context, value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Training QR')),
      body: MobileScanner(onDetect: _onDetect),
    );
  }
}

// class QrScannerPage extends StatelessWidget {
//   const QrScannerPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Scan Training QR')),
//       body: MobileScanner(
//         onDetect: (capture) {
//           final barcode = capture.barcodes.first;
//           final value = barcode.rawValue;
//           if (value != null) {
//             Navigator.pop(context, value);
//           }
//         },
//       ),
//     );
//   }
// }

String? formatTime(String? backendTime) {
  if (backendTime == null || backendTime.isEmpty) return null;

  try {
    final dateTime = DateTime.parse(backendTime);
    return DateFormat('HH:mm').format(dateTime);
  } catch (e) {
    return backendTime;
  }
}
