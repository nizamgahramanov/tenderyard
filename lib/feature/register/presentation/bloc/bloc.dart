import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenderyard/core/api_client/api_response.dart';
import 'package:tenderyard/feature/register/data/models/user_data_model.dart';
import 'package:tenderyard/feature/register/domain/usecases/register_as_individual.dart';
import 'package:tenderyard/feature/register/domain/usecases/register_as_individual_owner.dart';
import 'package:tenderyard/feature/register/domain/usecases/register_as_juridical_person.dart';

part 'register_bloc.dart';
part 'register_event.dart';
part 'register_state.dart';