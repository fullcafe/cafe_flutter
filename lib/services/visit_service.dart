import '../models/repository/visit_repo.dart';
import '../models/visit.dart';

class VisitService {
  late final VisitRepository _visitRepository;

  static VisitService? _visitService;

  VisitService._();

  static Future<VisitService> get instance async {
    if (_visitService == null) {
      _visitService = VisitService._();
      await _visitService!._init();
    }
    return _visitService!;
  }

  _init() async {
    final dio = await DioInit.instance;
    _visitRepository = VisitRepository(dio);
  }

  /// 새로운 방문 기록을 생성하는 메서드
  Future<void> createVisit(Visit visit) async {
    try {
      await _visitRepository.createVisit(visit);
    } catch (e) {
      print('Error creating visit: $e');
      throw Exception('Failed to create visit');
    }
  }

  /// 모든 방문 기록을 가져오는 메서드
  Future<List<Visit>> getAllVisits(String uid) async {
    try {
      return await _visitRepository.findAllVisitByUser(uid);
    } catch (e) {
      print('Error fetching all visits: $e');
      throw Exception('Failed to fetch visits');
    }
  }

  /// 리뷰 작성 가능한 방문 기록을 가져오는 메서드
  Future<List<Visit>> getWriteReviewVisits(String uid) async {
    try {
      return await _visitRepository.findWriteReviewVisitByUser(uid);
    } catch (e) {
      print('Error fetching write-review visits: $e');
      throw Exception('Failed to fetch write-review visits');
    }
  }

  /// 가장 많이 방문한 기록을 가져오는 메서드
  Future<List<Visit>> getMostCountVisits(String uid) async {
    try {
      return await _visitRepository.findMostCountVisitByUser(uid);
    } catch (e) {
      print('Error fetching most-count visits: $e');
      throw Exception('Failed to fetch most-count visits');
    }
  }
}
