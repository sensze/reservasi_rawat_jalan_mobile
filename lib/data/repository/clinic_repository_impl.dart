import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/data/model/clinic_model.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/repository/clinic_repository.dart';

import '../../locator.dart';
import '../data_sources/clinic_datasource.dart';

class ClinicRepositoryImpl extends ClinicRepository {
  final ClinicDataSource _clinicDataSource = locator<ClinicDataSource>();

  @override
  Future<Either<Exception, List<ClinicModel>>> getAllClinic() {
    return _clinicDataSource.getAllClinic();
  }
}
