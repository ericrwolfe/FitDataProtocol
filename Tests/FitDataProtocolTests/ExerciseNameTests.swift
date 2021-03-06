//
//  ExerciseNameTests.swift
//  FitDataProtocolTests
//
//  Created by Kevin Hoogheem on 2/11/18.
//

import XCTest
@testable import FitDataProtocol

class ExerciseNameTests: XCTestCase {
    static var allTests = [
        ("testBenchPressDups", testBenchPressDups),
        ("testBenchPressCreate", testCalfRaiseDups),

        ("testCalfRaiseDups", testCalfRaiseDups),
        ("testCalfRaiseCreate", testCalfRaiseCreate),

        ("testCardioDups", testCardioDups),
        ("testCardioCreate", testCardioCreate),

        ("testCarryDups", testCarryDups),
        ("testCarryCreate", testCarryCreate),

        ("testChopDups", testChopDups),
        ("testChopCreate", testChopCreate),

        ("testCoreDups", testCoreDups),
        ("testCoreCreate", testCoreCreate),

        ("testCrunchDups", testCrunchDups),
        ("testCrunchCreate", testCrunchCreate),

        ("testCurlDups", testCurlDups),
        ("testCurlCreate", testCurlCreate),

        ("testDeadliftDups", testDeadliftDups),
        ("testDeadliftCreate", testDeadliftCreate),

        ("testFlyeDups", testFlyeDups),
        ("testFlyeCreate", testFlyeCreate),

        ("testHipRaiseDups", testHipRaiseDups),
        ("testHipRaiseCreate", testHipRaiseCreate),

        ("testHipStabilityDups", testHipStabilityDups),
        ("testHipStabilityCreate", testHipStabilityCreate),

        ("testHipSwingDups", testHipSwingDups),
        ("testHipSwingCreate", testHipSwingCreate),

        ("testHyperextensionDups", testHyperextensionDups),
        ("testHyperextensionCreate", testHyperextensionCreate),

        ("testLateralRaiseDups", testLateralRaiseDups),
        ("testLateralRaiseCreate", testLateralRaiseCreate),

        ("testLegCurlDups", testLegCurlDups),
        ("testLegCurlCreate", testLegCurlCreate),

        ("testPushDups", testPushDups),
        ("testPushCreate", testPushCreate),
        
        ("testSquatDups", testSquatDups),
        ("testSquatCreate", testSquatCreate),
        
        ("testPlankDups", testPlankDups),
        ("testPlankCreate", testPlankCreate)
    ]
}

extension ExerciseNameTests {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testBenchPressDups() {
        
        let x = BenchPressExerciseName.supportedExerciseNames

        let duplicates = Array(Set(x.filter({ (i: BenchPressExerciseName) in x.filter({ $0.number == i.number }).count > 1})))

        if duplicates.count > 0 {
            for dup in duplicates {
                print("Dup: \(dup.number) - \(dup.name)")
            }
            XCTFail("Multiple same IDs found")
        }

        print("BenchPressExerciseName Count: \(BenchPressExerciseName.supportedExerciseNames.count)")
    }

    func testBenchPressCreate() {

        if BenchPressExerciseName.create(rawValue: 2) != BenchPressExerciseName.barbellBoardBenchPress {
            XCTFail("Wrong Exercise Name")
        }

        if BenchPressExerciseName.create(rawValue: 26) != BenchPressExerciseName.alternatingDumbbellChestPress {
            XCTFail("Wrong Exercise Name")
        }

        if BenchPressExerciseName.create(rawValue: UInt16(BenchPressExerciseName.supportedExerciseNames.count + 1)) != nil {
            XCTFail("Past Current Max")
        }
    }


    func testCalfRaiseDups() {

        let x = CalfRaiseExerciseName.supportedExerciseNames

        let duplicates = Array(Set(x.filter({ (i: CalfRaiseExerciseName) in x.filter({ $0.number == i.number }).count > 1})))

        if duplicates.count > 0 {
            for dup in duplicates {
                print("Dup: \(dup.number) - \(dup.name)")
            }
            XCTFail("Multiple same IDs found")
        }

        print("CalfRaiseExerciseName Count: \(CalfRaiseExerciseName.supportedExerciseNames.count)")
    }

    func testCalfRaiseCreate() {

        if CalfRaiseExerciseName.create(rawValue: 2) != CalfRaiseExerciseName.threewaySingleLegCalfRaise {
            XCTFail("Wrong Exercise Name")
        }

        if CalfRaiseExerciseName.create(rawValue: 20) != CalfRaiseExerciseName.weightedStandingDumbbellCalfRaise {
            XCTFail("Wrong Exercise Name")
        }

        if CalfRaiseExerciseName.create(rawValue: UInt16(CalfRaiseExerciseName.supportedExerciseNames.count + 1)) != nil {
            XCTFail("Past Current Max")
        }
    }


    func testCardioDups() {

        let x = CardioExerciseName.supportedExerciseNames

        let duplicates = Array(Set(x.filter({ (i: CardioExerciseName) in x.filter({ $0.number == i.number }).count > 1})))

        if duplicates.count > 0 {
            for dup in duplicates {
                print("Dup: \(dup.number) - \(dup.name)")
            }
            XCTFail("Multiple same IDs found")
        }

        print("CardioExerciseName Count: \(CardioExerciseName.supportedExerciseNames.count)")
    }

    func testCardioCreate() {

        if CardioExerciseName.create(rawValue: 2) != CardioExerciseName.cardioCoreCrawl {
            XCTFail("Wrong Exercise Name")
        }

        if CardioExerciseName.create(rawValue: 21) != CardioExerciseName.weightedTripleUnder {
            XCTFail("Wrong Exercise Name")
        }

        if CardioExerciseName.create(rawValue: UInt16(CardioExerciseName.supportedExerciseNames.count + 1)) != nil {
            XCTFail("Past Current Max")
        }
    }

    func testCarryDups() {

        let x = CarryExerciseName.supportedExerciseNames

        let duplicates = Array(Set(x.filter({ (i: CarryExerciseName) in x.filter({ $0.number == i.number }).count > 1})))

        if duplicates.count > 0 {
            for dup in duplicates {
                print("Dup: \(dup.number) - \(dup.name)")
            }
            XCTFail("Multiple same IDs found")
        }

        print("CarryExerciseName Count: \(CarryExerciseName.supportedExerciseNames.count)")
    }

    func testCarryCreate() {

        if CarryExerciseName.create(rawValue: 2) != CarryExerciseName.farmersWalkOnToes {
            XCTFail("Wrong Exercise Name")
        }

        if CarryExerciseName.create(rawValue: 4) != CarryExerciseName.overheadCarry {
            XCTFail("Wrong Exercise Name")
        }

        if CarryExerciseName.create(rawValue: UInt16(CarryExerciseName.supportedExerciseNames.count + 1)) != nil {
            XCTFail("Past Current Max")
        }
    }

    func testChopDups() {

        let x = ChopExerciseName.supportedExerciseNames

        let duplicates = Array(Set(x.filter({ (i: ChopExerciseName) in x.filter({ $0.number == i.number }).count > 1})))

        if duplicates.count > 0 {
            for dup in duplicates {
                print("Dup: \(dup.number) - \(dup.name)")
            }
            XCTFail("Multiple same IDs found")
        }

        print("ChopExerciseName Count: \(ChopExerciseName.supportedExerciseNames.count)")
    }

    func testChopCreate() {

        if ChopExerciseName.create(rawValue: 2) != ChopExerciseName.cableWoodchop {
            XCTFail("Wrong Exercise Name")
        }

        if ChopExerciseName.create(rawValue: 4) != ChopExerciseName.weightedCrossChopToKnee {
            XCTFail("Wrong Exercise Name")
        }

        if ChopExerciseName.create(rawValue: UInt16(ChopExerciseName.supportedExerciseNames.count + 1)) != nil {
            XCTFail("Past Current Max")
        }
    }

    func testCoreDups() {

        let x = CoreExerciseName.supportedExerciseNames

        let duplicates = Array(Set(x.filter({ (i: CoreExerciseName) in x.filter({ $0.number == i.number }).count > 1})))

        if duplicates.count > 0 {
            for dup in duplicates {
                print("Dup: \(dup.number) - \(dup.name)")
            }
            XCTFail("Multiple same IDs found")
        }

        print("CoreExerciseName Count: \(CoreExerciseName.supportedExerciseNames.count)")
    }

    func testCoreCreate() {

        if CoreExerciseName.create(rawValue: 2) != CoreExerciseName.alternatingPlateReach {
            XCTFail("Wrong Exercise Name")
        }

        if CoreExerciseName.create(rawValue: 4) != CoreExerciseName.weightedBarbellRollout {
            XCTFail("Wrong Exercise Name")
        }

        if CoreExerciseName.create(rawValue: UInt16(CoreExerciseName.supportedExerciseNames.count + 1)) != nil {
            XCTFail("Past Current Max")
        }
    }

    func testCrunchDups() {

        let x = CrunchExerciseName.supportedExerciseNames

        let duplicates = Array(Set(x.filter({ (i: CrunchExerciseName) in x.filter({ $0.number == i.number }).count > 1})))

        if duplicates.count > 0 {
            for dup in duplicates {
                print("Dup: \(dup.number) - \(dup.name)")
            }
            XCTFail("Multiple same IDs found")
        }

        print("CrunchExerciseName Count: \(CrunchExerciseName.supportedExerciseNames.count)")
    }

    func testCrunchCreate() {

        if CrunchExerciseName.create(rawValue: 2) != CrunchExerciseName.circularArmCrunch {
            XCTFail("Wrong Exercise Name")
        }

        if CrunchExerciseName.create(rawValue: 4) != CrunchExerciseName.weightedCrossedArmsCrunch {
            XCTFail("Wrong Exercise Name")
        }

        if CrunchExerciseName.create(rawValue: UInt16(CrunchExerciseName.supportedExerciseNames.count + 1)) != nil {
            XCTFail("Past Current Max")
        }
    }

    func testCurlDups() {

        let x = CurlExerciseName.supportedExerciseNames

        let duplicates = Array(Set(x.filter({ (i: CurlExerciseName) in x.filter({ $0.number == i.number }).count > 1})))

        if duplicates.count > 0 {
            for dup in duplicates {
                print("Dup: \(dup.number) - \(dup.name)")
            }
            XCTFail("Multiple same IDs found")
        }

        print("CurlExerciseName Count: \(CurlExerciseName.supportedExerciseNames.count)")
    }

    func testCurlCreate() {

        if CurlExerciseName.create(rawValue: 2) != CurlExerciseName.alternatingInclineDumbbellBicepsCurl {
            XCTFail("Wrong Exercise Name")
        }

        if CurlExerciseName.create(rawValue: 4) != CurlExerciseName.barbellReverseWristCurl {
            XCTFail("Wrong Exercise Name")
        }

        if CurlExerciseName.create(rawValue: UInt16(CurlExerciseName.supportedExerciseNames.count + 1)) != nil {
            XCTFail("Past Current Max")
        }
    }

    func testDeadliftDups() {

        let x = DeadliftExerciseName.supportedExerciseNames

        let duplicates = Array(Set(x.filter({ (i: DeadliftExerciseName) in x.filter({ $0.number == i.number }).count > 1})))

        if duplicates.count > 0 {
            for dup in duplicates {
                print("Dup: \(dup.number) - \(dup.name)")
            }
            XCTFail("Multiple same IDs found")
        }

        print("DeadliftExerciseName Count: \(DeadliftExerciseName.supportedExerciseNames.count)")
    }

    func testDeadliftCreate() {

        if DeadliftExerciseName.create(rawValue: 2) != DeadliftExerciseName.dumbbellDeadlift {
            XCTFail("Wrong Exercise Name")
        }

        if DeadliftExerciseName.create(rawValue: 4) != DeadliftExerciseName.dumbbellStraightLegDeadlift {
            XCTFail("Wrong Exercise Name")
        }

        if DeadliftExerciseName.create(rawValue: UInt16(DeadliftExerciseName.supportedExerciseNames.count + 1)) != nil {
            XCTFail("Past Current Max")
        }
    }

    func testFlyeDups() {

        let x = FlyeExerciseName.supportedExerciseNames

        let duplicates = Array(Set(x.filter({ (i: FlyeExerciseName) in x.filter({ $0.number == i.number }).count > 1})))

        if duplicates.count > 0 {
            for dup in duplicates {
                print("Dup: \(dup.number) - \(dup.name)")
            }
            XCTFail("Multiple same IDs found")
        }

        print("FlyeExerciseName Count: \(FlyeExerciseName.supportedExerciseNames.count)")
    }

    func testFlyeCreate() {

        if FlyeExerciseName.create(rawValue: 2) != FlyeExerciseName.dumbbellFlye {
            XCTFail("Wrong Exercise Name")
        }

        if FlyeExerciseName.create(rawValue: 4) != FlyeExerciseName.kettlebellFlye {
            XCTFail("Wrong Exercise Name")
        }

        if FlyeExerciseName.create(rawValue: UInt16(FlyeExerciseName.supportedExerciseNames.count + 1)) != nil {
            XCTFail("Past Current Max")
        }
    }

    func testHipRaiseDups() {

        let x = HipRaiseExerciseName.supportedExerciseNames

        let duplicates = Array(Set(x.filter({ (i: HipRaiseExerciseName) in x.filter({ $0.number == i.number }).count > 1})))

        if duplicates.count > 0 {
            for dup in duplicates {
                print("Dup: \(dup.number) - \(dup.name)")
            }
            XCTFail("Multiple same IDs found")
        }

        print("HipRaiseExerciseName Count: \(HipRaiseExerciseName.supportedExerciseNames.count)")
    }

    func testHipRaiseCreate() {

        if HipRaiseExerciseName.create(rawValue: 2) != HipRaiseExerciseName.bentKneeSwissBallReverseHipRaise {
            XCTFail("Wrong Exercise Name")
        }

        if HipRaiseExerciseName.create(rawValue: 4) != HipRaiseExerciseName.bridgeLegExtension {
            XCTFail("Wrong Exercise Name")
        }

        if HipRaiseExerciseName.create(rawValue: UInt16(HipRaiseExerciseName.supportedExerciseNames.count + 1)) != nil {
            XCTFail("Past Current Max")
        }
    }

    func testHipStabilityDups() {

        let x = HipStabilityExerciseName.supportedExerciseNames

        let duplicates = Array(Set(x.filter({ (i: HipStabilityExerciseName) in x.filter({ $0.number == i.number }).count > 1})))

        if duplicates.count > 0 {
            for dup in duplicates {
                print("Dup: \(dup.number) - \(dup.name)")
            }
            XCTFail("Multiple same IDs found")
        }

        print("HipStabilityExerciseName Count: \(HipStabilityExerciseName.supportedExerciseNames.count)")
    }

    func testHipStabilityCreate() {

        if HipStabilityExerciseName.create(rawValue: 2) != HipStabilityExerciseName.weightedDeadBug {
            XCTFail("Wrong Exercise Name")
        }

        if HipStabilityExerciseName.create(rawValue: 4) != HipStabilityExerciseName.weightedExternalHipRaise {
            XCTFail("Wrong Exercise Name")
        }

        if HipStabilityExerciseName.create(rawValue: UInt16(HipStabilityExerciseName.supportedExerciseNames.count + 1)) != nil {
            XCTFail("Past Current Max")
        }
    }

    func testHipSwingDups() {

        let x = HipSwingExerciseName.supportedExerciseNames

        let duplicates = Array(Set(x.filter({ (i: HipSwingExerciseName) in x.filter({ $0.number == i.number }).count > 1})))

        if duplicates.count > 0 {
            for dup in duplicates {
                print("Dup: \(dup.number) - \(dup.name)")
            }
            XCTFail("Multiple same IDs found")
        }

        print("HipSwingExerciseName Count: \(HipSwingExerciseName.supportedExerciseNames.count)")
    }

    func testHipSwingCreate() {

        if HipSwingExerciseName.create(rawValue: 2) != HipSwingExerciseName.stepOutSwing {
            XCTFail("Wrong Exercise Name")
        }

        if HipSwingExerciseName.create(rawValue: 1) != HipSwingExerciseName.singleArmDumbbellSwing {
            XCTFail("Wrong Exercise Name")
        }

        if HipSwingExerciseName.create(rawValue: UInt16(HipSwingExerciseName.supportedExerciseNames.count + 1)) != nil {
            XCTFail("Past Current Max")
        }
    }


    func testHyperextensionDups() {

        let x = HyperextensionExerciseName.supportedExerciseNames

        let duplicates = Array(Set(x.filter({ (i: HyperextensionExerciseName) in x.filter({ $0.number == i.number }).count > 1})))

        if duplicates.count > 0 {
            for dup in duplicates {
                print("Dup: \(dup.number) - \(dup.name)")
            }
            XCTFail("Multiple same IDs found")
        }

        print("HyperextensionExerciseName Count: \(HyperextensionExerciseName.supportedExerciseNames.count)")
    }

    func testHyperextensionCreate() {

        if HyperextensionExerciseName.create(rawValue: 2) != HyperextensionExerciseName.baseRotations {
            XCTFail("Wrong Exercise Name")
        }

        if HyperextensionExerciseName.create(rawValue: 4) != HyperextensionExerciseName.bentKneeReverseHyperextension {
            XCTFail("Wrong Exercise Name")
        }

        if HyperextensionExerciseName.create(rawValue: UInt16(HyperextensionExerciseName.supportedExerciseNames.count + 1)) != nil {
            XCTFail("Past Current Max")
        }
    }

    func testLateralRaiseDups() {

        let x = LateralRaiseExerciseName.supportedExerciseNames

        let duplicates = Array(Set(x.filter({ (i: LateralRaiseExerciseName) in x.filter({ $0.number == i.number }).count > 1})))

        if duplicates.count > 0 {
            for dup in duplicates {
                print("Dup: \(dup.number) - \(dup.name)")
            }
            XCTFail("Multiple same IDs found")
        }

        print("LateralRaiseExerciseName Count: \(LateralRaiseExerciseName.supportedExerciseNames.count)")
    }

    func testLateralRaiseCreate() {

        if let nametype = ExerciseCategory.lateralRaise.exerciseName(from: 0) {
            if nametype is LateralRaiseExerciseName == false {
                XCTFail("Wrong Type, Make sure it is added to the Exercise Category")
            }
        }

        if LateralRaiseExerciseName.create(rawValue: 2) != LateralRaiseExerciseName.barMuscleUp {
            XCTFail("Wrong Exercise Name")
        }

        if LateralRaiseExerciseName.create(rawValue: 4) != LateralRaiseExerciseName.cableDiagonalRaise {
            XCTFail("Wrong Exercise Name")
        }

        if LateralRaiseExerciseName.create(rawValue: UInt16(LateralRaiseExerciseName.supportedExerciseNames.count + 1)) != nil {
            XCTFail("Past Current Max")
        }
    }

    func testLegCurlDups() {

        let x = LegCurlExerciseName.supportedExerciseNames

        let duplicates = Array(Set(x.filter({ (i: LegCurlExerciseName) in x.filter({ $0.number == i.number }).count > 1})))

        if duplicates.count > 0 {
            for dup in duplicates {
                print("Dup: \(dup.number) - \(dup.name)")
            }
            XCTFail("Multiple same IDs found")
        }

        print("LegCurlExerciseName Count: \(LegCurlExerciseName.supportedExerciseNames.count)")
    }

    func testLegCurlCreate() {

        if let nametype = ExerciseCategory.legCurl.exerciseName(from: 0) {
            if nametype is LegCurlExerciseName == false {
                XCTFail("Wrong Type, Make sure it is added to the Exercise Category")
            }
        }

        if LegCurlExerciseName.create(rawValue: 2) != LegCurlExerciseName.goodMorning {
            XCTFail("Wrong Exercise Name")
        }

        if LegCurlExerciseName.create(rawValue: 4) != LegCurlExerciseName.singleLegBarbellGoodMorning {
            XCTFail("Wrong Exercise Name")
        }

        if LegCurlExerciseName.create(rawValue: UInt16(LegCurlExerciseName.supportedExerciseNames.count + 1)) != nil {
            XCTFail("Past Current Max")
        }
    }

    func testPushDups() {

        let x = PushUpExerciseName.supportedExerciseNames

        let duplicates = Array(Set(x.filter({ (i: PushUpExerciseName) in x.filter({ $0.number == i.number }).count > 1})))

        if duplicates.count > 0 {
            for dup in duplicates {
                print("Dup: \(dup.number) - \(dup.name)")
            }
            XCTFail("Multiple same IDs found")
        }

        print("PushUpExerciseName Count: \(PushUpExerciseName.supportedExerciseNames.count)")
    }

    func testPushCreate() {

        if let nametype = ExerciseCategory.pushUp.exerciseName(from: 0) {
            if nametype is PushUpExerciseName == false {
                XCTFail("Wrong Type, Make sure it is added to the Exercise Category")
            }
        }

        if PushUpExerciseName.create(rawValue: 2) != .weightedAlternatingStaggeredPushUp {
            XCTFail("Wrong Exercise Name")
        }

        if PushUpExerciseName.create(rawValue: 4) != .weightedAlternatingHandsMedicineBallPushUp {
            XCTFail("Wrong Exercise Name")
        }

        if PushUpExerciseName.create(rawValue: UInt16(PushUpExerciseName.supportedExerciseNames.count + 1)) != nil {
            XCTFail("Past Current Max")
        }
    }

    func testSquatDups() {

        let x = SquatExerciseName.supportedExerciseNames

        let duplicates = Array(Set(x.filter({ (i: SquatExerciseName) in x.filter({ $0.number == i.number }).count > 1})))

        if duplicates.count > 0 {
            for dup in duplicates {
                print("Dup: \(dup.number) - \(dup.name)")
            }
            XCTFail("Multiple same IDs found")
        }

        print("SquatExerciseName Count: \(SquatExerciseName.supportedExerciseNames.count)")
    }

    func testSquatCreate() {

        if let nametype = ExerciseCategory.squat.exerciseName(from: 0) {
            if nametype is SquatExerciseName == false {
                XCTFail("Wrong Type, Make sure it is added to the Exercise Category")
            }
        }

        if SquatExerciseName.create(rawValue: 2) != .backSquats {
            XCTFail("Wrong Exercise Name")
        }

        if SquatExerciseName.create(rawValue: 4) != .balancingSquat {
            XCTFail("Wrong Exercise Name")
        }

        if SquatExerciseName.create(rawValue: UInt16(SquatExerciseName.supportedExerciseNames.count + 1)) != nil {
            XCTFail("Past Current Max")
        }
    }

    func testPlankDups() {

        let x = PlankExerciseName.supportedExerciseNames

        let duplicates = Array(Set(x.filter({ (i: PlankExerciseName) in x.filter({ $0.number == i.number }).count > 1})))

        if duplicates.count > 0 {
            for dup in duplicates {
                print("Dup: \(dup.number) - \(dup.name)")
            }
            XCTFail("Multiple same IDs found")
        }

        print("PlankExerciseName Count: \(PlankExerciseName.supportedExerciseNames.count)")
    }

    func testPlankCreate() {

        if let nametype = ExerciseCategory.plank.exerciseName(from: 0) {
            if nametype is PlankExerciseName == false {
                XCTFail("Wrong Type, Make sure it is added to the Exercise Category")
            }
        }

        if PlankExerciseName.create(rawValue: 2) != .nintyDegreeStaticHold {
            XCTFail("Wrong Exercise Name")
        }

        if PlankExerciseName.create(rawValue: 4) != .bearCrawl {
            XCTFail("Wrong Exercise Name")
        }

        if PlankExerciseName.create(rawValue: UInt16(PlankExerciseName.supportedExerciseNames.count + 1)) != nil {
            XCTFail("Past Current Max")
        }
    }

}

