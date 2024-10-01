### Makefile for tasks app ###

SHELL := /bin/bash

build_runner: ## Generate files
        cd test && flutter pub get && flutter pub run build_runner build  --delete-conflicting-outputs && cd ..

## Testing
test_datasource:
	   flutter test test/src/modules/currencies/data/datasource/remote_datasource.dart

test_entity:
	   flutter test test/src/modules/currencies/data/entity/currency_entity.dart

test_repository:
	   flutter test test/src/modules/currencies/data/repository/repository.dart

test_model:
	   flutter test test/src/modules/currencies/domain/data/model/currency_model.dart

test_usecase:
	   flutter test test/src/modules/currencies/domain/usecase/currencies_usecase.dart

test_bloc:
	   flutter test test/src/modules/currencies/presentation/bloc/currencies_bloc.dart	&&
	   flutter test test/src/modules/currencies/presentation/bloc/historical_currency_bloc.dart  &&
	   flutter test test/src/modules/currencies/presentation/bloc/converter_currencies_bloc.dart   