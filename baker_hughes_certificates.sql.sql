-- =============================================
-- Baker Hughes Certificate Database
-- Generated from certificates.json
-- Created: 2026-03-15
-- =============================================

-- Create database
CREATE DATABASE IF NOT EXISTS baker_hughes_certificates;
USE baker_hughes_certificates;

-- =============================================
-- Main table for certificates
-- =============================================
CREATE TABLE certificates (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ordinary_number VARCHAR(50) NOT NULL,
    type VARCHAR(200) NOT NULL,
    id_number VARCHAR(100),
    description TEXT,
    serial_number TEXT,
    date_of_inspection DATE,
    date_of_next_inspection DATE,
    location_of_inspection TEXT,
    serviced_performed TEXT,
    inspected_by VARCHAR(200),
    report_number VARCHAR(100) UNIQUE,
    po_number VARCHAR(50),
    scanned_cert VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    INDEX idx_ordinary (ordinary_number),
    INDEX idx_type (type),
    INDEX idx_report (report_number),
    INDEX idx_po (po_number),
    INDEX idx_inspection_date (date_of_inspection),
    INDEX idx_next_inspection (date_of_next_inspection)
);

-- =============================================
-- Table for multi-item serial numbers
-- =============================================
CREATE TABLE certificate_items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    certificate_id INT NOT NULL,
    item_type VARCHAR(100),
    serial_number TEXT,
    status VARCHAR(50) DEFAULT 'Active',
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (certificate_id) REFERENCES certificates(id) ON DELETE CASCADE,
    INDEX idx_serial (serial_number(100))
);

-- =============================================
-- Insert all certificates from JSON
-- =============================================

INSERT INTO certificates (
    ordinary_number, type, id_number, description, serial_number, 
    date_of_inspection, date_of_next_inspection, location_of_inspection, 
    serviced_performed, inspected_by, report_number, po_number, scanned_cert
) VALUES
('1', 'INJECTOR TRANSPORT BASKET', 'PPG71507', NULL, NULL, '2025-12-24', '2026-06-24', 'Turkmenistan - Hazar - Base', 'Lifting inspection - visual/mpi', 'YOKARY HILLI HYZMAT', 'YHH-BH-IR-25-747', '9000828597', 'YHH-BH-IR-25-747.jpg'),
('2', 'Injector Head 6100', 'CX-1069413/IF-8591', NULL, 'HST/DNV -00438400-001\nHST/DNV -00438400-002', '2025-12-24', '2026-06-24', 'Turkmenistan-Hazar-Baker-Hughes-base', 'Lifting inspection - visual/mpi', 'Yokary Hilli Hyzmat', 'YHH-BH-IR-25-748', '9000828597', 'YHH-BH-IR-25-748.jpg'),
('3', 'Stripper with Frame', '241-55186', NULL, '533-2-1', '2025-12-24', '2026-06-24', 'Turkmenistan-Hazar-Baker-Hughes-base', 'Lifting inspection - visual/mpi', 'Yokary Hilli Hyzmat', 'YHH-BH-IR-25-748', '9000828597', 'YHH-BH-IR-25-748_1.jpg'),
('4', 'Goosneck', 'CX-1069413', NULL, NULL, '2025-12-24', '2026-06-24', 'Turkmenistan-Hazar-Baker-Hughes-base', 'Lifting inspection - visual/mpi', 'Yokary Hilli Hyzmat', 'YHH-BH-IR-25-749', '9000828597', 'YHH-BH-IR-25-749.jpg'),
('5', 'Gas rack', 'GR 001', NULL, '97818/E', '2025-12-24', '2026-06-24', 'Turkmenistan-Hazar-Baker-Hughes-base', 'Lifting inspection - visual/mpi', 'Yokary Hilli Hyzmat', 'YHH-BH-IR-25-750', '9000828597', 'YHH-BH-IR-25-750.jpg'),
('6', 'Gas rack', 'Gr 002', NULL, '97818/F', '2025-12-24', '2026-06-24', 'Turkmenistan-Hazar-Baker-Hughes-base', 'Lifting inspection - visual/mpi', 'Yokary Hilli Hyzmat', 'YHH-BH-IR-25-751', '9000828597', 'YHH-BH-IR-25-751.jpg'),
('7', 'Nitrogen tank', 'BHIU0000156', NULL, NULL, '2025-12-24', '2026-06-24', 'Turkmenistan-Hazar-Baker-Hughes-base', 'Lifting inspection - visual/mpi', 'Yokary Hilli Hyzmat', 'YHH-BH-IR-25-752', '9000828597', 'YHH-BH-IR-25-752.jpg'),
('8', 'SIS Pump', 'W240316.007', NULL, '25RAOOS', '2025-12-24', '2026-06-24', 'Turkmenistan-Hazar-Baker-Hughes-base', 'Lifting inspection - visual/mpi', 'Yokary Hilli Hyzmat', 'YHH-BH-IR-25-753', '9000828597', 'YHH-BH-IR-25-753.jpg'),
('9', '400 cfm AIR compresor', 'Z07U053314', NULL, 'ILF10/3-1', '2025-12-24', '2026-06-24', 'Turkmenistan-Hazar-Baker-Hughes-base', 'Lifting inspection - visual/mpi', 'Yokary Hilli Hyzmat', 'YHH-BH-IR-25-754', '9000828597', 'YHH-BH-IR-25-754.jpg'),
('10', 'Basket', 'HH 10-075', NULL, 'HH10-075A', '2025-12-24', '2026-06-24', 'Turkmenistan-Hazar-Baker-Hughes-base', 'Lifting inspection - visual/mpi', 'Yokary Hilli Hyzmat', 'YHH-BH-IR-25-755', '9000828597', 'YHH-BH-IR-25-755.jpg'),
('11', 'Basket', 'BM-HH-1021', NULL, 'BM-HH-102/1', '2025-12-24', '2026-06-24', 'Turkmenistan-Hazar-Baker-Hughes-base', 'Lifting inspection - visual/mpi', 'Yokary Hilli Hyzmat', 'YHH-BH-IR-25-756', '9000828597', 'YHH-BH-IR-25-756.jpg'),
('12', 'Basket', 'FT-HH-10102', NULL, 'FT-HH-10102/1', '2025-12-24', '2026-06-24', 'Turkmenistan-Hazar-Baker-Hughes-base', 'Lifting inspection - visual/mpi', 'Yokary Hilli Hyzmat', 'YHH-BH-IR-25-757', '9000828597', 'YHH-BH-IR-25-757.jpg'),
('13', 'Basket', 'CBDR-07', NULL, 'BN08288849', '2025-12-24', '2026-06-24', 'Turkmenistan-Hazar-Baker-Hughes-base', 'Lifting inspection - visual/mpi', 'Yokary Hilli Hyzmat', 'YHH-BH-IR-25-758', '9000828597', 'YHH-BH-IR-25-758.jpg'),
('14', 'Batch Mixer', 'BM-001', NULL, '82364-1/1', '2025-12-24', '2026-06-24', 'Turkmenistan-Hazar-Baker-Hughes-base', 'Lifting inspection - visual/mpi', 'Yokary Hilli Hyzmat', 'YHH-BH-IR-25-759', '9000828597', 'YHH-BH-IR-25-759.jpg'),
('15', 'Container', 'TS2449', NULL, '141881/4', '2025-12-24', '2026-06-24', 'Turkmenistan-Hazar-Baker-Hughes-base', 'Lifting inspection - visual/mpi', 'Yokary Hilli Hyzmat', 'YHH-BH-IR-25-760', '9000828597', 'YHH-BH-IR-25-760.jpg'),
('16', 'Batch Mixer', '07-03-049', NULL, '584570', '2025-12-24', '2026-06-24', 'Turkmenistan-Hazar-Baker-Hughes-base', 'Lifting inspection - visual/mpi', 'Yokary Hilli Hyzmat', 'YHH-BH-IR-25-761', '9000828597', 'YHH-BH-IR-25-761.jpg'),
('17', 'Air Compressor', '352273UAP820', NULL, 'Sling 4 legs - 9060', '2025-12-27', '2026-06-27', 'Turkmenistan-Hazar-Baker-Hughes-base', 'Lifting inspection - visual/mpi', 'Yokary Hilli Hyzmat', 'YHH-BH-IR-25-762', '9000828597', 'YHH-BH-IR-25-761.jpg'),
('18', 'Pump Unit', 'PPY61567/757728-03', NULL, 'Sling 4 Legs - AS745/5', '2025-12-27', '2026-06-27', 'Turkmenistan-Hazar-Baker-Hughes-base', 'Lifting inspection - visual/mpi', 'Yokary Hilli Hyzmat', 'YHH-BH-IR-25-763', '9000828597', 'YHH-BH-IR-25-763.jpg'),
('19', 'Injector Transport Basket', '8-CTU-557-0/108498', NULL, 'Slings 4 legs  - CTRG-N2-231', '2025-12-27', '2026-06-27', 'Turkmenistan-Hazar-Baker-Hughes-base', 'Lifting inspection - visual/mpi', 'Yokary Hilli Hyzmat', 'YHH-BH-IR-25-764', '9000828597', 'YHH-BH-IR-25-764.jpg'),
('20', 'Gooseneck, CT100"', '680', NULL, 'Sling 1 Leg - 75224/1', '2025-12-27', '2026-06-27', 'Turkmenistan-Hazar-Baker-Hughes-base', 'Lifting inspection - visual/mpi', 'Yokary Hilli Hyzmat', 'YHH-BH-IR-25-765', '9000828597', 'YHH-BH-IR-25-765.jpg');

-- =============================================
-- Insert multi-item certificates (with multiple serial numbers)
-- =============================================

-- First, get the certificate IDs for multi-item reports
INSERT INTO certificates (ordinary_number, type, id_number, date_of_inspection, date_of_next_inspection, location_of_inspection, serviced_performed, inspected_by, report_number, po_number, scanned_cert) VALUES
('39', 'Examination Report', NULL, '2025-12-27', '2026-06-27', 'Turkmenistan-Hazar-Baker-Hughes-base', 'Lifting inspection - visual/mpi', 'Yokary Hilli Hyzmat', 'YHH-BH-IR-25-795', '9000828597', 'YHH-BH-IR-25-795.jpg'),
('40', 'Examination Report', NULL, '2025-12-27', '2026-06-27', 'Turkmenistan-Hazar-Baker-Hughes-base', 'Lifting inspection - visual/mpi', 'Yokary Hilli Hyzmat', 'YHH-BH-IR-25-796', '9000828597', 'YHH-BH-IR-25-796.jpg'),
('41', 'Lifitng Gear Inspection Report (Chain Slings within shackles)', '1. 379307-2-3', '2025-12-27', '2026-06-27', 'Turkmenistan-Hazar-Baker-Hughes-base', 'Lifting inspection - visual/mpi', 'Yokary Hilli Hyzmat', 'YHH-BH-IR-25-797', '9000828597', 'YHH-BH-IR-25-797.jpg'),
('42', 'Lifitng Gear Inspection Report (Webbing Slings)', NULL, '2025-12-27', '2026-06-27', 'Turkmenistan-Hazar-Baker-Hughes-base', 'Lifting inspection - visual/mpi', 'Yokary Hilli Hyzmat', 'YHH-BH-IR-25-798', '9000828597', 'YHH-BH-IR-25-798.jpg'),
('43', 'Lifting Equipment & Gears Examination Report', NULL, '2025-12-27', '2026-06-27', 'Turkmenistan-Hazar-Baker-Hughes-base', 'Lifting inspection - visual/mpi', 'Yokary Hilli Hyzmat', 'YHH-BH-IR-25-799', '9000828597', 'YHH-BH-IR-25-799.jpg'),
('44', 'Lifting Equipment & Gears Examination Report', NULL, '2025-12-27', '2026-06-27', 'Turkmenistan-Hazar-Baker-Hughes-base', 'Lifting inspection - visual/mpi', 'Yokary Hilli Hyzmat', 'YHH-BH-IR-25-802', '9000828597', 'YHH-BH-IR-25-802.jpg');

-- Insert items for report YHH-BH-IR-25-795
INSERT INTO certificate_items (certificate_id, item_type, serial_number, status) VALUES
((SELECT id FROM certificates WHERE report_number = 'YHH-BH-IR-25-795'), 'Lever block', '209180841', 'Active'),
((SELECT id FROM certificates WHERE report_number = 'YHH-BH-IR-25-795'), 'Lever block', 'T200700327', 'Active'),
((SELECT id FROM certificates WHERE report_number = 'YHH-BH-IR-25-795'), 'Lever block', 'T20130076', 'Active'),
((SELECT id FROM certificates WHERE report_number = 'YHH-BH-IR-25-795'), 'Lever block', '2052106252 L', 'Active'),
((SELECT id FROM certificates WHERE report_number = 'YHH-BH-IR-25-795'), 'Chain Block', '16101284', 'Active'),
((SELECT id FROM certificates WHERE report_number = 'YHH-BH-IR-25-795'), 'Lever Block', 'T20120085', 'Active');

-- Insert items for report YHH-BH-IR-25-796
INSERT INTO certificate_items (certificate_id, item_type, serial_number, status) VALUES
((SELECT id FROM certificates WHERE report_number = 'YHH-BH-IR-25-796'), 'Load Binder/Ratchet', 'BH 04', 'Active'),
((SELECT id FROM certificates WHERE report_number = 'YHH-BH-IR-25-796'), 'Load Binder/Ratchet', 'BH-7', 'Active'),
((SELECT id FROM certificates WHERE report_number = 'YHH-BH-IR-25-796'), 'Load Binder/Ratchet', 'CSY7153', 'Active'),
((SELECT id FROM certificates WHERE report_number = 'YHH-BH-IR-25-796'), 'Load Binder/Ratchet', 'BH 24/40', 'Active');

-- Insert items for report YHH-BH-IR-25-798
INSERT INTO certificate_items (certificate_id, item_type, serial_number, status) VALUES
((SELECT id FROM certificates WHERE report_number = 'YHH-BH-IR-25-798'), 'Webbing Sling', 'B932', 'Active'),
((SELECT id FROM certificates WHERE report_number = 'YHH-BH-IR-25-798'), 'Webbing Sling', 'B833', 'Active'),
((SELECT id FROM certificates WHERE report_number = 'YHH-BH-IR-25-798'), 'Webbing Sling', '98503-6-9', 'Active'),
((SELECT id FROM certificates WHERE report_number = 'YHH-BH-IR-25-798'), 'Webbing Sling', 'L4-12808', 'Active'),
((SELECT id FROM certificates WHERE report_number = 'YHH-BH-IR-25-798'), 'Webbing Sling', 'L4-12880', 'Active'),
((SELECT id FROM certificates WHERE report_number = 'YHH-BH-IR-25-798'), 'Webbing Sling', 'L3-44918', 'Active'),
((SELECT id FROM certificates WHERE report_number = 'YHH-BH-IR-25-798'), 'Webbing Sling', 'L3-44875', 'Active');

-- Insert items for report YHH-BH-IR-25-799
INSERT INTO certificate_items (certificate_id, item_type, serial_number, status) VALUES
((SELECT id FROM certificates WHERE report_number = 'YHH-BH-IR-25-799'), 'Safety Harness', 'S1312', 'Active'),
((SELECT id FROM certificates WHERE report_number = 'YHH-BH-IR-25-799'), 'Safety Harness', '0239', 'Active'),
((SELECT id FROM certificates WHERE report_number = 'YHH-BH-IR-25-799'), 'Safety Harness', 'BH-SH-04', 'Active');

-- Insert rejected item for report YHH-BH-IR-25-802
INSERT INTO certificate_items (certificate_id, item_type, serial_number, status, notes) VALUES
((SELECT id FROM certificates WHERE report_number = 'YHH-BH-IR-25-802'), 'Lever Block', 'T20110023', 'Rejected', 'Rejected during inspection');

-- =============================================
-- Create useful views
-- =============================================

-- View for upcoming inspections
CREATE VIEW upcoming_inspections AS
SELECT 
    ordinary_number,
    type,
    id_number,
    date_of_inspection,
    date_of_next_inspection,
    location_of_inspection,
    report_number,
    DATEDIFF(date_of_next_inspection, CURDATE()) AS days_until_next
FROM certificates
WHERE date_of_next_inspection IS NOT NULL
ORDER BY date_of_next_inspection;

-- View for expired certificates
CREATE VIEW expired_certificates AS
SELECT 
    ordinary_number,
    type,
    id_number,
    date_of_inspection,
    date_of_next_inspection,
    report_number,
    DATEDIFF(CURDATE(), date_of_next_inspection) AS days_overdue
FROM certificates
WHERE date_of_next_inspection < CURDATE()
ORDER BY date_of_next_inspection;

-- View for multi-item certificates
CREATE VIEW multi_item_certificates AS
SELECT 
    c.report_number,
    c.type AS certificate_type,
    ci.item_type,
    ci.serial_number,
    ci.status,
    ci.notes
FROM certificates c
JOIN certificate_items ci ON c.id = ci.certificate_id;

-- =============================================
-- Create stored procedures
-- =============================================

DELIMITER //

-- Procedure to get certificates by date range
CREATE PROCEDURE GetCertificatesByDateRange(
    IN start_date DATE,
    IN end_date DATE
)
BEGIN
    SELECT * FROM certificates
    WHERE date_of_inspection BETWEEN start_date AND end_date
    ORDER BY date_of_inspection;
END //

-- Procedure to search certificates
CREATE PROCEDURE SearchCertificates(
    IN search_term VARCHAR(255)
)
BEGIN
    SELECT * FROM certificates
    WHERE ordinary_number LIKE CONCAT('%', search_term, '%')
       OR type LIKE CONCAT('%', search_term, '%')
       OR id_number LIKE CONCAT('%', search_term, '%')
       OR report_number LIKE CONCAT('%', search_term, '%')
       OR po_number LIKE CONCAT('%', search_term, '%')
    ORDER BY ordinary_number;
END //

DELIMITER ;

-- =============================================
-- Show statistics
-- =============================================
SELECT 'Database created successfully!' AS Status;
SELECT COUNT(*) AS Total_Certificates FROM certificates;
SELECT COUNT(*) AS Total_Items FROM certificate_items;
SELECT 
    SUM(CASE WHEN date_of_next_inspection >= CURDATE() THEN 1 ELSE 0 END) AS Valid,
    SUM(CASE WHEN date_of_next_inspection < CURDATE() THEN 1 ELSE 0 END) AS Expired
FROM certificates;